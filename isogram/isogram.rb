# frozen_string_literal: true

class Isogram
  # version 1

  # def self.isogram?(str)
  #   chars = str.downcase.scan(/\w/)
  #   chars == chars.uniq
  # end

  # version 2

  def self.isogram?(str)
    /(\w+).*\1/i !~ str
  end
end
