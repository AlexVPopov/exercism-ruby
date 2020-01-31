# frozen_string_literal

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, qualifier)
    range(qualifier).map { |day| Date.new(year, month, day) }
                    .find { |date| date.public_send "#{weekday}?" }
  end

  private

  attr_reader :month, :year

  def range(qualifier)
    case qualifier
    when :first then (1..7)
    when :second then (8..14)
    when :third then (15..21)
    when :fourth then (22..28)
    when :teenth then (13..19)
    else
       last_day = Date.new(year, month, -1).day
       first_day = last_day - 6
       (first_day..last_day)
    end
  end
end
