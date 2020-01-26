# frozen_string_literal: true

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase.scan(/[\w']+/).reduce(Hash.new(0)) { |acc, word| acc[word.downcase] += 1; acc }
  end

  private

  attr_reader :phrase
end
