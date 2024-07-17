# frozen_string_literal: true

require 'time'

class TimeConversion
  def self.run(time)
    # This line solves the problem... but it seemed against the point of
    # the kata to solve it with strptime.
    # Time.strptime(time, "%I:%M:%S%P").strftime("%H:%M:%S")

    new(time).run
  end

  def initialize(time)
    time = time.dup
    self.suffix = time.slice!(-2..-1)
    self.hour, self.minutes, self.seconds = time.split ':'
  end

  def run
    [military_hour, minutes, seconds].join(':')
  end

  private

  attr_accessor :suffix, :hour, :minutes, :seconds

  def military_hour
    if midnight_hour?
      '00'
    elsif one_pm_to_mightnight?
      hour.to_i + 12
    else
      hour
    end
  end

  def midnight_hour?
    suffix == 'AM' && hour == '12'
  end

  def one_pm_to_mightnight?
    suffix == 'PM' && hour != '12'
  end
end
