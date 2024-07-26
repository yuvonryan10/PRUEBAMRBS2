<?php
namespace MRBS;

require '../defaultincludes.inc';

http_headers(array("Content-type: application/x-javascript"),
             60*30);  // 30 minute expiry

if ($use_strict)
{
  echo "'use strict';\n";
}

// Check whether the calendar navigation bar has wrapped, and if so add a class of
// 'wrapped' so that CSS can be used to change its styling.
?>
var checkNavWrapping = function() {
    var navMainCalendar = $('nav.main_calendar');
    var wrapped = false;
    var lastTop;
    <?php
    // Remove the wrapped class before we start, because the wrapped class gives the
    // element a flex-basis of 100%, which would force wrapping anyway.  (We need the
    // flex-basis of 100% to ensure that it takes up the whole line when wrapped and we
    // don't get the next element on the same line.)
    ?>
    navMainCalendar.removeClass('wrapped');
    navMainCalendar.first().children().each(function() {
        var thisTop = $(this).offset().top;
        <?php
        // Allow 5px of tolerance on the calculation of the top to allow for padding, border
        // and margin.
        ?>
        if ((typeof lastTop !== 'undefined') && (Math.abs(thisTop - lastTop) > 5))
        {
          wrapped = true;
          return false;
        }
        lastTop = thisTop;
      });
    if (wrapped)
    {
      navMainCalendar.addClass('wrapped');
    }
  };

<?php
// Only show the bottom nav bar if no part of the top one is visible.
?>
var checkNav = function() {
    var nav = $('nav.main_calendar');
    if (nav.eq(0).visible(true))
    {
      nav.eq(1).hide();
    }
    else
    {
      nav.eq(1).show();
    }
  };


<?php
// Replace the body element with the body in response, for the page href.
?>
var replaceBody = function(response, href) {
    <?php
    // We get the entire page HTML returned, but we are only interested in the <body> element.
    // That's because if we replace the whole HTML the browser will re-load the JavaScript and
    // CSS files which is unnecessary and will also cause problems if the CSS is not loaded in
    // time.
    //
    // Unfortunately, we can't use jQuery.replaceWith() on the body object as that doesn't work
    // properly.  So we have to replace the body HTML and then update the attributes for the body
    // tag afterwards.
    ?>
    var matches = response.match(/(<body[^>]*>)([^<]*(?:(?!<\/?body)<[^<]*)*)<\/body\s*>/i);
    var body = $('body');
    body.html(matches[2]);
    $('<div' + matches[1].substring(5) + '</div>').each(function() {
        $.each(this.attributes, function() {
            <?php
            // this.attributes is not a plain object, but an array
            // of attribute nodes, which contain both the name and value
            ?>
            if(this.specified)
            {
              if (this.name.substring(0, 5).toLowerCase() === 'data-')
              {
                <?php
                // Data attributes have to be updated differently from other attributes because
                // they are cached by jQuery.
                ?>
                var value = this.value;
                <?php // If the attribute looks like a JSON array, then turn it back into an array. ?>
                if (value.charAt(0) === '[')
                {
                  try {
                    value = JSON.parse(value);
                  }
                  catch (e) {
                    value = this.value;
                  }
                }
                <?php // If it looks like it should be a boolean then turn it back into one.  ?>
                else if (value === 'true')
                {
                  value = true;
                }
                else if (value === 'false')
                {
                  value = false;
                }
                body.data(this.name.substring(5), value);
              }
              else
              {
                body.attr(this.name, this.value);
              }
            }
          });
      });

    <?php
    // Trigger a page_ready event, because the normal document ready event
    // won't be triggered when we are just replacing the html.
    ?>
    $(document).trigger('page_ready');

    <?php // and tell the server we've moved to a new page, so that it can update its records ?>
    var data = {csrf_token: getCSRFToken(), page: href};
    if(args.site)
    {
      data.site = args.site;
    }
    $.post('ajax/update_page.php', data);

    <?php // change the URL in the address bar ?>
    history.pushState(null, '', href);

  };


<?php
// Update the <body> element either via an Ajax call or using a pre-fetched response,
// in order to avoid flickering of the screen as we move between pages in the calendar view.
//
// 'event' can either be an event object if the function is called from an 'on'
// handler, or else it as an href string (eg when called from flatpickr).
?>
var updateBody = function(event) {
    var href;

    if (typeof event === 'object')
    {
      href = $(this).attr('href');
      event.preventDefault();
    }
    else
    {
      href = event;
    }

    <?php // Add a "Loading ..." message ?>
    $('h2.date').text('<?php echo get_vocab('loading')?>')
                .addClass('loading');

    if (updateBody.prefetched && updateBody.prefetched[href])
    {
      replaceBody(updateBody.prefetched[href], href);
    }
    else
    {
      <?php
      // Keep track of the last Ajax request, because it's only that one that we're
      // interested in: if the server is slow and the user clicks on a succession
      // of dates, we only want to show the data for the last date.
      ?>
      updateBody.lastRequest = href;
      <?php
      // We don't want a refresh to happen while we're waiting for the next date.
      ?>
      refreshPage.disabled = true;
      $.get({url: href, dataType: 'html'})
        .done(function(response) {
            <?php // Only process this response if it corresponds to the last request ?>
            if (href === updateBody.lastRequest)
            {
              updateBody.lastRequest = null;
              refreshPage.disabled = false;
              replaceBody(response, href);
            }
          });
    }
  };


<?php
// Pre-fetch the prev and next pages to improve performance.  They are probably
// the two most likely pages to be required.
?>
var prefetch = function() {
  <?php
  // Don't pre-fetch if it's been disabled in the config
  if (empty($prefetch_refresh_rate))
  {
    ?>
    return;
    <?php
  }
  // Don't pre-fetch if we're in the process of moving to a different date (no point)
  // or if we're on a metered connection (would waste bandwidth).
  ?>
  if (updateBody.lastRequest || isMeteredConnection())
  {
    return;
  }

  var delay = <?php echo $prefetch_refresh_rate?> * 1000;
  var hrefs = [];
  ['a.prev', 'a.next'].forEach(function(anchor) {
      var a = $(anchor);
      <?php
      // Don't waste time prefetching data for links that aren't visible, which
      // they won't be if we are in kiosk mode.
      ?>
      if (a.is(':visible'))
      {
        var href = a.attr('href');
        if (typeof href !== 'undefined')
        {
          hrefs.push(href);
        }
      }
    });

  <?php // Clear any existing pre-fetched data and any timeout ?>
  updateBody.prefetched = {};
  clearTimeout(prefetch.timeoutId);

  <?php
  // Don't pre-fetch if the page is hidden.  Just set another timeout
  ?>
  if (isHidden())
  {
    prefetch.timeoutId = setTimeout(prefetch, delay);
    return;
  }

  hrefs.forEach(function(href) {
    $.get({url: href, dataType: 'html'})
      .fail(function() {
          <?php // Don't do anything if the request failed ?>
        })
      .done(function(response) {
          updateBody.prefetched[href] = response;
          <?php // Once we've got all the responses back set off another timeout ?>
          if (Object.keys(updateBody.prefetched).length === hrefs.length)
          {
            <?php
            // Only set another timeout if the request was successful.  There's no point
            // in doing so if it failed: it will probably fail again and just fill up
            // the PHP error log.
            ?>
            prefetch.timeoutId = setTimeout(prefetch, delay);
          }
        });
    });

};


$(document).on('page_ready', function() {

  <?php
  // Turn the room and area selects into fancy select boxes and then
  // show the location menu (it's hidden to avoid screen jiggling).
  ?>
  $('.room_area_select').mrbsSelect();
  $('nav.location').removeClass('js_hidden');

  <?php
  // Check the wrapping on the calendar navigation so that we can change the
  // styling if it has.
  ?>
  checkNavWrapping();
  $(window).on('resize', checkNavWrapping);

  <?php
  // The bottom navigation was hidden while the Select2 boxes were formed
  // so that the correct widths could be established.  It is then shown if
  // the top navigation is not visible.
  ?>
  $('nav.main_calendar').removeClass('js_hidden');
  checkNav();
  $(window).on('scroll', checkNav);
  $(window).on('resize', checkNav);

  <?php
  // Only reveal the color key once the bottom navigation has been determined,
  // in order to avoid jiggling.
  ?>
  $('.color_key').removeClass('js_hidden');

  <?php
  // Replace the navigation links with Ajax calls in order to eliminate flickering
  // as we move between pages.
  ?>
  $('nav.arrow a, nav.view a').on('click', updateBody);


  <?php
  // In kiosk mode intercept all mouse and keyboard events as (a) we don't want to
  // allow links to be clicked and (b) that's the way a user exits kiosk mode
  ?>
  if (args.kiosk)
  {
    <?php // We need to use a jQuery UI dialog because we can't time out a confirm box ?>
    var dialog = $('<div id="dialog_exit_kiosk"></div>');
    var timeout;

    $(document.body).on('click keypress', function(e) {

      function dialogClose() {
        dialog.dialog('close');
      }

      e.preventDefault();

      if (!dialog.dialog('instance'))
      {
        dialog.dialog({
          buttons: [
            {text: "<?php echo escape_js(get_vocab('ok'))?>",
              click: function() {
                var href = 'kiosk.php?kiosk=' + encodeURIComponent(args.kiosk);
                href += '&area=' + encodeURIComponent(args.area);
                href += '&room=' + encodeURIComponent(args.room);
                if (args.site)
                {
                  href += '&site=' + encodeURIComponent(args.site);
                }
                $.redirect(href, {'csrf_token': getCSRFToken()});
              }
            },
            {text: "<?php echo escape_js(get_vocab('cancel'))?>",
              click: function() {
                dialog.dialog('close');
              }
            }
          ],
          close: function(event, ui) {
            <?php // Clear the timeout so that a dialog being reopened gets a new timeout ?>
            clearTimeout(timeout);
          },
          closeText: "<?php echo escape_js(get_vocab('close'))?>",
          modal: true,
          open: function(event, ui){
            timeout = setTimeout(dialogClose, <?php echo $kiosk_exit_dialog_timeout; ?> *1000);
          },
          title: "<?php echo escape_js(get_vocab('exit_kiosk_mode_confirm'))?>"
        });
      }
      <?php // Don't open a dialog if the event came from one ?>
      else if (!dialog.dialog('isOpen') && !$(e.target).parents('[role="dialog"]').length)
      {
        dialog.dialog('open');
      }

      return false;

    });
  }

  <?php
  // Pre-fetch some pages to improve performance
  ?>
  prefetch();
});
