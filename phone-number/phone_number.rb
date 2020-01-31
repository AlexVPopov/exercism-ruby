# frozen_string_literal

class PhoneNumber
  def self.clean(number)
    number = number.scan(/\d/).join.sub(/\A1/, '')
    number if number.match? /\A[2-9]\d{2}[2-9]\d{6}\z/
  end
end
