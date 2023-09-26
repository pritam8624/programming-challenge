# frozen_string_literal: true

require 'time'

module TimeRangeable
  def duration_in_seconds
    (parsed_end_time - parsed_start_time).to_i
  end

  def formatted_duration
    hours, minutes = duration_in_minutes.divmod(60)
    "#{hours}hr #{minutes}m"
  end

  def start_time_to_s
    format_date_time(parsed_start_time)
  end

  def end_time_to_s
    format_date_time(parsed_end_time)
  end

  private

  def parsed_end_time
    parse_time(end_time)
  end

  def parsed_start_time
    parse_time(start_time)
  end

  def parse_time(date_time)
    Time.parse(date_time)
  end

  def duration_in_minutes
    duration_in_seconds / 60
  end

  def format_date_time(date_time)
    date_time.strftime('%H:%M %d %b %Y %z')
  end
end
