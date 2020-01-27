# frozen_string_literal: true

class Clock
  attr_reader :hour, :minute

  def initialize(hour: nil, minute: nil)
    remaining_hour, @minute = minute.nil? ? [0, 0] : minute.divmod(60)
    @hour = (hour.nil? ? remaining_hour : hour + remaining_hour) % 24
  end

  def to_s
    "%02d:%02d" % [hour, minute]
  end

  def +(clock)
    self.class.new(hour: hour + clock.hour, minute: minute + clock.minute)
  end

  def -(clock)
    self.class.new(hour: hour - clock.hour, minute: minute - clock.minute)
  end

  def ==(clock)
    to_s == clock.to_s
  end
end
