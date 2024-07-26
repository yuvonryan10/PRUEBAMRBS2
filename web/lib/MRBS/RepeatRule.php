<?php
declare(strict_types=1);
namespace MRBS;

use InvalidArgumentException;
use MRBS\ICalendar\RFC5545;

class RepeatRule
{
  // Repeat types
  public const NONE = 0;
  public const DAILY = 1;
  public const WEEKLY = 2;
  public const MONTHLY = 3;
  public const YEARLY = 4;
  public const REPEAT_TYPES = [
    self::NONE,
    self::DAILY,
    self::WEEKLY,
    self::MONTHLY,
    self::YEARLY
  ];

  // Monthly repeat types
  public const MONTHLY_ABSOLUTE = 0;
  public const MONTHLY_RELATIVE = 1;
  public const MONTHLY_TYPES = [
    self::MONTHLY_ABSOLUTE,
    self::MONTHLY_RELATIVE
  ];

  private $days = [];  // An array of days for weekly repeats; 0 for Sunday, etc.
  private $end_date;  // The repeat end date.  A DateTime object
  private $interval;  // The repeat interval
  private $monthly_absolute;  // The absolute day of the month to repeat on for monthly repeats
  private $monthly_relative;  // The relative day of the month to repeat on for monthly repeats
  private $monthly_type;  // The monthly repeat type (Absolute or relative).  An int.
  private $type;  // The repeat type (NONE, DAILY, etc.).  An int.


  public function getDays() : array
  {
    return $this->days;
  }


  // Returns a list of repeat days as a string (eg "Thursday Friday"),
  // sorted in order and starting at $weekstarts
  public function getDaysAsNames(bool $for_mail=false) : string
  {
    global $weekstarts;

    $names = array();
    $locale = ($for_mail) ? get_mail_locale() : null;

    for ($i=0; $i<DAYS_PER_WEEK; $i++)
    {
      $d = ($i + $weekstarts) % DAYS_PER_WEEK;
      if (in_array($d, $this->getDays()))
      {
        $names[] = day_name($d, null, $locale);
      }
    }

    return implode(' ', $names);
  }


  public function getEndDate() : ?DateTime
  {
    return $this->end_date ?? null;
  }

  public function getInterval() : ?int
  {
    return $this->interval ?? null;
  }


  // Returns the interval units, in the local language.  If $for_mail
  // is set the mail language is used.
  public function getIntervalUnits(bool $for_mail=false) : string
  {
    $repeat_type = $this->getType();
    $repeat_interval = $this->getInterval();

    if ($for_mail)
    {
      switch ($repeat_type)
      {
        case RepeatRule::DAILY:
          return ($repeat_interval == 1) ? get_mail_vocab('day') : get_mail_vocab('days');
          break;
        case RepeatRule::WEEKLY:
          return ($repeat_interval == 1) ? get_mail_vocab('week') : get_mail_vocab('weeks');
          break;
        case RepeatRule::MONTHLY:
          return ($repeat_interval == 1) ? get_mail_vocab('month') : get_mail_vocab('months');
          break;
        case RepeatRule::YEARLY:
          return ($repeat_interval == 1) ? get_mail_vocab('year_lc') : get_mail_vocab('years');
          break;
        default:
          return '';
          break;
      }
    }

    switch ($repeat_type)
    {
      case RepeatRule::DAILY:
        return ($repeat_interval == 1) ? get_vocab('day') : get_vocab('days');
        break;
      case RepeatRule::WEEKLY:
        return ($repeat_interval == 1) ? get_vocab('week') : get_vocab('weeks');
        break;
      case RepeatRule::MONTHLY:
        return ($repeat_interval == 1) ? get_vocab('month') : get_vocab('months');
        break;
      case RepeatRule::YEARLY:
        return ($repeat_interval == 1) ? get_vocab('year_lc') : get_vocab('years');
        break;
      default:
        return '';
        break;
    }
  }

  public function getMonthlyAbsolute() : ?int
  {
    return $this->monthly_absolute ?? null;
  }

  public function getMonthlyRelative() : ?string
  {
    return $this->monthly_relative ?? null;
  }

  public function getMonthlyType() : ?int
  {
    return $this->monthly_type ?? null;
  }


  // Returns the repeat days encoded as a 7 character string for use in the database
  public function getRepOpt() : string
  {
    $result = '';

    for ($i = 0; $i < DAYS_PER_WEEK; $i++)
    {
      $result .= in_array($i, $this->days) ? '1' : '0';
    }

    return $result;
  }


  public function getType() : int
  {
    return $this->type;
  }

  public function setDays(array $days) : void
  {
    foreach ($days as $day)
    {
      // Cast to int
      $this->days[] = (int) $day;
      // Check it's a valid day
      if (($day < 0) || ($day > 6))
      {
        throw new InvalidArgumentException("Invalid day of the week '$day'");
      }
    }
    // We need the repeat days to be in order
    sort($this->days);
  }


  public function setDaysFromOpt(string $rep_opt) : void
  {
    $days = [];

    for ($i=0; $i<DAYS_PER_WEEK; $i++)
    {
      if (isset($rep_opt[$i]) && $rep_opt[$i])
      {
        $days[] = $i;
      }
    }

    $this->setDays($days);
  }


  // Set the repeat days given an array of RFC5545 days, eg ['MO', 'TH'].
  public function setDaysFromRFC5545(array $rfc5545_days) : void
  {
    $days = [];

    foreach ($rfc5545_days as $rfc5545_day)
    {
      $days[] = RFC5545::convertDayToOrd($rfc5545_day);
    }

    $this->setDays($days);
  }


  public function setEndDate(?DateTime $end_date) : void
  {
    $this->end_date = $end_date;
  }

  public function setInterval(int $interval) : void
  {
    $this->interval = $interval;
  }

  public function setMonthlyAbsolute(?int $absolute) : void
  {
    $this->monthly_absolute = $absolute;
  }

  public function setMonthlyRelative(?string $relative) : void
  {
    $this->monthly_relative = $relative;
  }

  public function setMonthlyType(?int $monthly_type) : void
  {
    if (!in_array($monthly_type, self::MONTHLY_TYPES))
    {
      throw new InvalidArgumentException("Invalid monthly type '$monthly_type'");
    }
    $this->monthly_type = $monthly_type;
  }

  public function setType(int $type) : void
  {
    if (!in_array($type, self::REPEAT_TYPES))
    {
      throw new InvalidArgumentException("Invalid repeat type '$type'");
    }
    $this->type = $type;
  }


  // Returns an array of start times for the entries in this series given a start time
  // for the beginning of the series.  Optionally limited to $limit entries.
  public function getRepeatStartTimes(int $start_time, int $limit=null) : array
  {
    $entries = array();

    $date = new DateTime();
    $date->setTimestamp($start_time);

    // Make sure that the first date is a member of the series
    switch($this->getType())
    {
      case self::WEEKLY:
        $repeat_days = $this->getDays();
        $n_repeat_days = count($repeat_days); // We will need this later
        if ($n_repeat_days == 0)
        {
          throw new Exception("No weekly repeat days specified in repeat rule");
        }
        while (!in_array($date->format('w'), $repeat_days))
        {
          // The hour will be preserved across DST transitions
          $date->modify('+1 day');
        }
        $start_dow = $date->format('w'); // We will need this later
        $start_index = array_search($start_dow, $repeat_days); // We will need this later
        break;

      case self::MONTHLY:
        if ($this->getMonthlyType() == self::MONTHLY_ABSOLUTE)
        {
          if ($date->getDay() != $this->getMonthlyAbsolute())
          {
            if ($date->getDay() > $this->getMonthlyAbsolute())
            {
              $date->modify('+1 month');
            }
            $date->setDayNoOverflow($this->getMonthlyAbsolute());
          }
        }
        else // must be relative
        {
          // Advance to a month that has this relative date. For example, not
          // every month will have a '5SU' (fifth Sunday)
          while (false === $date->setRelativeDay($this->getMonthlyRelative()))
          {
            $date->modify('+1 month');
          }
        }
        break;

      case self::YEARLY:
        $start_day = $date->getDay(); // We will need this later
        break;

      default:
        break;
    }

    // Now get the entry start times
    $i = 0;
    // TODO: check end_date condition
    while ((!isset($limit) || ($i < $limit)) && ($date <= $this->getEndDate()))
    {
      // Add this start date to the result and increment the counter
      $i++;
      $entries[] = $date->getTimestamp();

      // Advance to the next entry
      switch ($this->getType())
      {
        case self::DAILY:
          $modifier = '+' . $this->getInterval() . 'days';
          $date->modify($modifier);
          break;

        case self::WEEKLY:
          $delta_weeks = $this->getInterval();
          // If there is more than one repeat day then advance to the next repeat day
          if ($n_repeat_days > 1)
          {
            // Get the next repeat day
            $current_index = array_search($date->format('w'), $repeat_days);
            $next_index = ($current_index + 1) % $n_repeat_days;
            // Advance to it
            $modifier = '+' . (($repeat_days[$next_index] + DAYS_PER_WEEK - $repeat_days[$current_index]) % DAYS_PER_WEEK) . 'days';
            $date->modify($modifier);
            // If we're back to the start day then we need to advance by the interval less a week.
            // Otherwise, we don't need to do anything more
            $delta_weeks = ($next_index == $start_index) ? $delta_weeks - 1 : 0;
          }
          // Advance by the required number of weeks
          if ($delta_weeks != 0)
          {
            $modifier = '+' . $delta_weeks . ' weeks';
            $date->modify($modifier);
          }
          break;

        case self::MONTHLY:
          // Move the date forward by the interval number of months
          $date->modifyMonthsNoOverflow($this->getInterval(), true);
          // If it's an absolute date then set the day again, in case previously the date
          // was moved back to the end of the month.
          if ($this->getMonthlyType() == self::MONTHLY_ABSOLUTE)
          {
            $date->setDayNoOverflow($this->getMonthlyAbsolute());
          }
          // If it's a relative date then set the new relative date in the first month that's
          // got one.
          else
          {
            while (false === $date->setRelativeDay($this->getMonthlyRelative()))
            {
              $date->modifyMonthsNoOverflow($this->getInterval(), true);
            }
          }
          break;

        case self::YEARLY:
          // Move the year forward by the interval number of years
          $date->modifyYearsNoOverflow($this->getInterval(), true);
          // Get the day of the month back to where it should be (in case we
          // decremented it to make it a valid date last time round)
          $date->setDayNoOverflow($start_day);
          break;
      }
    }

    return $entries;
  }


  // TODO: remove temporary code when the transition to RepeatRule is complete
  // Temporary method while we transition the code to using RepeatRule.
  // Converts a new style $data into one with old style repeat fields
  public static function fixUp(array $data) : array
  {
    $result = $data;

    if (isset($data['repeat_rule']))
    {
      $repeat_rule = $data['repeat_rule'];
      $result['rep_type'] = $repeat_rule->getType();
      $result['rep_interval'] = $repeat_rule->getInterval();
      $repeat_end_date = $repeat_rule->getEndDate();
      $result['end_date'] = (isset($repeat_end_date)) ? $repeat_end_date->getTimestamp() : null;
      $result['rep_opt'] = $repeat_rule->getRepOpt();
      $result['monthly_absolute'] = $repeat_rule->getMonthlyAbsolute();
      $result['monthly_relative'] = $repeat_rule->getMonthlyRelative();
    }

    return $result;
  }


  // Converts a repeat rule to an RFC5545 recurrence rule (RRULE)
  public function toRFC5545Rule() : string
  {
    $rule = '';

    if ($this->getType() == self::NONE)
    {
      return $rule;
    }

    switch($this->getType())
    {
      case self::DAILY:
        $rule .= "FREQ=DAILY";
        break;

      case self::WEEKLY:
        $rule .= "FREQ=WEEKLY";
        // Get the repeat days of the week
        $days_of_week = array();
        foreach ($this->getDays() as $day)
        {
          $days_of_week[] = RFC5545::DAYS[$day];
        }
        $dow_list = implode(',', $days_of_week);
        if (!empty($dow_list))
        {
          $rule .= ";BYDAY=$dow_list";
        }
        break;

      case self::MONTHLY:
        $rule .= "FREQ=MONTHLY";
        if ($this->getMonthlyType() == self::MONTHLY_ABSOLUTE)
        {
          $rule .= ";BYMONTHDAY=" . $this->getMonthlyAbsolute();
        }
        else
        {
          $rule .= ";BYDAY=" . $this->getMonthlyRelative();
        }
        break;

      case self::YEARLY:
        $rule .= "FREQ=YEARLY";
        break;
    }

    // The interval (if necessary)
    if ($this->getInterval() > 1)
    {
      $rule .= ";INTERVAL=" . $this->getInterval();
    }

    // The UNTIL date-time "MUST be specified in UTC time"
    $rule .= ";UNTIL=" . gmdate(RFC5545::DATETIME_FORMAT . '\Z', $this->getEndDate()->getTimestamp());

    return $rule;
  }
}
