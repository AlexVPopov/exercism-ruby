# frozen_string_literal

class Affine
  ALPHABET = [*'a'..'z'].freeze

  def initialize(a, b, m = 26)
    raise ArgumentError unless gcd(a, m) == 1

    @a = a
    @b = b
    @m = m
  end

  def encode(text)
    text.gsub(/[^[:alnum:]]/, '')
        .downcase
        .chars
        .map { |char| char =~ /\d/ ? char : ALPHABET[encrypt(char)] }
        .each_slice(5)
        .map(&:join)
        .join(' ')
  end

  def decode(text)
    text.gsub(/\s/, '')
        .chars
        .map do |char|
          result = ALPHABET[((encrypt(char) - b) % m) / a]
          puts result
          result
        end
        .join
  end

  private

  attr_reader :a, :b, :m

  def gcd(a, b)
    a, b = [a, b].sort.reverse

    b.zero? ? a : gcd(b, a % b)
  end

  def encrypt(char)
    (a * ALPHABET.index(char) + b) % m
  end
end
