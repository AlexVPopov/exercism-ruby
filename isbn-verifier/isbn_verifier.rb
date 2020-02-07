# frozen_string_literal

class IsbnVerifier
  def self.valid?(string)
    digits = string.scan(/\d|X/)

    return false unless digits.count == 10

    digits[-1] = 10 if digits[-1] == 'X'

    digits.map.with_index { |digit, index| digit.to_i * (10 - index) }.sum % 11 == 0
  end
end
