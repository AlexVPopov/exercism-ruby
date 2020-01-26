# frozen_string_literal: true

class Series
  def initialize(number)
    @number = number
  end

  def slices(n)
    raise ArgumentError if number.length < n

    number.chars.each_cons(n).map(&:join)
  end

  private

  attr_reader :number
end
