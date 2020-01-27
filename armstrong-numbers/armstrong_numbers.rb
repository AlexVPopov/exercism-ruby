# frozen_string_literal: true

class ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    digit_count = digits.count
    number == digits.sum { |digit| digit ** digit_count }
  end
end
