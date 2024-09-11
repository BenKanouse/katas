# frozen_string_literal: true

class TimeConversion
  MATCH_TIME_REGEX = /(\d{1,2}):(\d{2})(?::(\d{2}))?\s?(AM|PM)/i
  NAMED_MATCH_TIME_REGEX = /(?<hours>\d{1,2}):(?<minutes>\d{2}):(?<seconds>\d{2})?\s?(?<period>AM|PM)/i

  def self.run(time)
    convert_as_match(time)
    #convert_as_named_match(time)
  end

  def self.convert_as_match(time)
    match_data = MATCH_TIME_REGEX.match(time)
    hours, minutes, seconds, period = match_data.captures
    hours = hours.to_i

    hours += 12 if period.downcase == 'pm' && hours != 12
    hours = 0 if period.downcase == 'am' && hours == 12

    format('%02d:%02d:%02d', hours, minutes.to_i, seconds.to_i)
  end

  def self.convert_as_named_match(time)
    match_data = NAMED_MATCH_TIME_REGEX.match(time)
    time_hash = match_data.named_captures
    hours = time_hash['hours'].to_i
    minutes = time_hash['minutes'].to_i
    seconds = time_hash['seconds'].to_i
    period = time_hash['period']

    hours += 12 if period.downcase == 'pm' && hours != 12
    hours = 0 if period.downcase == 'am' && hours == 12

    format('%02d:%02d:%02d', hours, minutes.to_i, seconds.to_i)
  end
end
