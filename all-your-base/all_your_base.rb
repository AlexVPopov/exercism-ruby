# frozen_string_literal

class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError unless input_base > 1 &&
                               output_base > 1 &&
                               digits.all? { |digit| (0..(input_base-1)).cover?(digit) }

    decimal_number = digits.reduce(0) { |decimal, digit| decimal * input_base + digit }

    result = [decimal_number % output_base]

    result.unshift(decimal_number % output_base) while (decimal_number /= output_base) > 0

    result
  end
end
