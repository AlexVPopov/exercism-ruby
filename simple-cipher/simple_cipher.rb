# frozen_string_literal

class Cipher
  KEY_PATTERN = /\A[a-z]+\z/.freeze
  ALPHABET = ('a'..'z').to_a.freeze

  attr_reader :key

  def initialize(key = random_key)
    raise ArgumentError unless key.nil? || key =~ KEY_PATTERN
    @key = key
  end

  def encode(plaintext)
    transform(plaintext, :encode_char)
  end

  def decode(ciphertext)
    transform(ciphertext, :decode_char)
  end

  private

  def transform(text, operation)
    text.chars
        .map
        .with_index { |char, index| send operation, char, key[index] }
        .join
  end

  def random_key
    ALPHABET.sample(100).join
  end

  def rotations_for(char)
    ALPHABET.index(char)
  end

  def cipherbet(rotations)
    ALPHABET.rotate(rotations)
  end

  def encode_char(char, key)
    char.tr(ALPHABET.join, cipherbet(rotations_for(key)).join)
  end

  def decode_char(char, key)
    char.tr(cipherbet(rotations_for(key)).join, ALPHABET.join)
  end
end
