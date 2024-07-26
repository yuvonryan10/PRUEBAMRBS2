<?php
declare(strict_types=1);
namespace MRBS;

use DateInterval;
use IntlDateFormatter;
use OpenPsa\Ranger\Ranger;

class EntryInterval
{
  private $start_date;
  private $end_date;
  private $is_periods_mode;

  private const DEFAULT_DATE_TYPE = IntlDateFormatter::MEDIUM;
  private const DEFAULT_TIME_TYPE = IntlDateFormatter::SHORT;


  // $start_time and $end_time are Unix timestamps
  public function __construct(int $start_timestamp, int $end_timestamp, bool $is_periods_mode)
  {
    $this->start_date = new DateTime();
    $this->start_date->setTimestamp($start_timestamp);
    $this->end_date = new DateTime();
    $this->end_date->setTimestamp($end_timestamp);
    $this->is_periods_mode = $is_periods_mode;
  }


  public function __toString()
  {
    global $datetime_formats;

    $start_time = $this->start_date->getTimestamp();
    $end_time = $this->end_date->getTimestamp();
    // If we're in periods mode, the last period is actually the one before the
    // period that starts at the end time
    if ($this->is_periods_mode)
    {
      $end_time = $end_time - 60;
    }

    // Just in case they have been unset in the config file
    $date_type = $datetime_formats['range_datetime']['date_type'] ?? self::DEFAULT_DATE_TYPE;
    $time_type = $datetime_formats['range_datetime']['time_type'] ?? self::DEFAULT_TIME_TYPE;

    $ranger = new Ranger(get_mrbs_locale());
    $ranger
      ->setRangeSeparator(get_vocab('range_separator'))
      ->setDateTimeSeparator(get_vocab('date_time_separator'))
      ->setDateType($date_type)
      ->setTimeType($time_type);
    $range = $ranger->format($start_time, $end_time);

    // If we're in periods mode, substitute the period names for times
    if ($this->is_periods_mode)
    {
      // First of all substitute the start time
      // Note that we are using the global IntlDateFormatter, rather than using the
      // IntlDateFormatterFactory, because that's what Ranger will have used, so we
      // want the same result, regardless of whether it's correct or not.
      $formatter = new IntlDateFormatter(get_mrbs_locale(), IntlDateFormatter::NONE, $time_type);
      $start_time_string = $formatter->format($start_time);
      $start_period_name = period_name_timestamp($start_time);
      $range = str_replace($start_time_string, $start_period_name, $range);
      if ($start_time !== $end_time)
      {
        // Then do the end time if there is one
        $end_time_string = $formatter->format($end_time);
        $end_period_name = period_name_timestamp($end_time);
        $range = str_replace($end_time_string, $end_period_name, $range);
        // Then because the Ranger will have missed out the AM/PM information for one of
        // the times if it's the same for both times (eg 12:01 - 12:02pm, or 下午12:03 - 12:04),
        // we need to work out what the strings would be without the AM/PM information is and
        // substitute those.  So get the pattern, strip the AMPM symbols and modify the formatter.
        $pattern = $formatter->getPattern();
        $pattern_short = self::trimAMPM($pattern);
        $formatter->setPattern($pattern_short);
        // Now do the start time again, looking for the short string
        $start_time_string_short = $formatter->format($start_time);
        $range = str_replace($start_time_string_short, $start_period_name, $range);
        // And then the end time again
        $end_time_string_short = $formatter->format($end_time);
        $range = str_replace($end_time_string_short, $end_period_name, $range);
      }
    }

    return $range;
  }


  // Checks whether the interval overlaps a holiday.  Returns FALSE if it doesn't,
  // or the first overlapped holiday as an MRBS\DateTime object if it does.
  public function overlapsHoliday()
  {
    // Zero the $date and $end times so that the while condition works.
    $date = clone $this->start_date;
    $date->setTime(0,0);
    $end = clone $this->end_date;
    $end->setTime(0, 0);

    while ($date <= $end)
    {
      if ($date->isHoliday())
      {
        return $date;
      }
      $date->add(new DateInterval('P1D'));
    }

    return false;
  }


  // Checks whether the interval overlaps a weekend.  Returns FALSE if it doesn't,
  // or the first overlapped weekend day as an MRBS\DateTime object if it does.
  public function overlapsWeekend()
  {
    // Zero the $date and $end times so that the while condition works.
    $date = clone $this->start_date;
    $date->setTime(0,0);
    $end = clone $this->end_date;
    $end->setTime(0, 0);
    $i = 0;

    // Don't check more than a week's worth of days in case no weekend days have been defined
    while (($date <= $end) && ($i<DAYS_PER_WEEK))
    {
      if ($date->isWeekend())
      {
        return $date;
      }
      $date->add(new DateInterval('P1D'));
      $i++;
    }

    return false;
  }


  // Checks whether an entry spans more than one calendar (not booking) day
  public function spansMultipleDays() : bool
  {
    $format = 'Y-m-d';
    return ($this->start_date->format($format) !== $this->end_date->format($format));
  }


  // Trim whitespace, including NBSP, and any AMPM symbols ('a', 'b' and 'B') from the pattern
  private static function trimAMPM($pattern) : string
  {
    $result = trim($pattern, "abB \n\r\t\v\x00");
    // And trim any non-breaking spaces which can occur between the time and AM/PM information
    $result = preg_replace("/^\s+|\s+$/u", '', $result);

    return $result;
  }

}
