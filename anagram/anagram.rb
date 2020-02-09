# frozen_string_literal: true

class Anagram
  def initialize(base_word)
    @base_word = base_word.downcase
  end

  def match(words)
    words.select do |word|
      word = word.downcase
      word != base_word && word.chars.sort == base_word.chars.sort
    end
  end

  private

  attr_reader :base_word
end
