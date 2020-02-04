# frozen_string_literal

class Series
  def initialize(digits)
    raise ArgumentError if digits =~ /\D/

    @digits = digits.scan(/\d/).map(&:to_i)
  end

  def largest_product(n)
    raise ArgumentError if n > digits.count

    return 1 if n.zero?

    digits.each_cons(n).map { |group| group.reduce(:*) }.max
  end

  private

  attr_reader :digits
end
