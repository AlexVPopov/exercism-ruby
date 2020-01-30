# frozen_string_literal

class Pangram
  def self.pangram?(sentence)
    (('a'..'z').to_a - sentence.downcase.chars).empty?
  end
end
