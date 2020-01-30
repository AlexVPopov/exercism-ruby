# frozen_string_literal

class Luhn
  def self.valid?(raw_number)
    number = raw_number.to_s.gsub(/\s/, '')

    return false unless number =~ /\A\d{2,}\z/

    digits = number.chars.map(&:to_i).reverse.map.with_index do |digit, index|
      if index.odd?
        product = digit * 2

        product > 9 ? product.digits.sum : product
      else
        digit
      end
    end

    (digits.sum % 10).zero?
  end
end
