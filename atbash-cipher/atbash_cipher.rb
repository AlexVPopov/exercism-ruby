# frozen_string_literal: true

class Atbash
  PLAIN_ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze
  CIPHER_ALPHABET = 'zyxwvutsrqponmlkjihgfedcba'.freeze
  # MAPPING = Hash[PLAIN_ALPHABET.zip(CIPHER_ALPHABET)].freeze

  def self.encode(text)
    normalize(text)
      .tr(PLAIN_ALPHABET, CIPHER_ALPHABET)
      .scan(/.{1,5}/)
      .join(' ')
  end

  def self.decode(text)
    normalize(text).tr(CIPHER_ALPHABET, PLAIN_ALPHABET)
  end

  def self.normalize(text)
    text.downcase.scan(/\w+/).join
  end

  private_class_method :normalize
end
