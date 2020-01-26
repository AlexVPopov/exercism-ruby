# frozen_string_literal: true

class Scrabble
  LETTER_VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word.to_s.strip.upcase
  end

  def score
    word.chars.sum { |char| LETTER_VALUES.find { |set, _value| set.include?(char) }.last }
  end

  private

  attr_reader :word
end
