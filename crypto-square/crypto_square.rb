# frozen_string_literal

class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    return text if text.empty?

    text.scan(/.{1,#{row_length}}/)
        .map { |row| row.ljust(row_length) }
        .map(&:chars)
        .transpose
        .map(&:join)
        .join(' ')
  end

  private

  attr_reader :plaintext

  def text
    @text ||= plaintext.downcase.scan(/\w+/).join
  end

  def row_length
    @row_length ||= Math.sqrt(text.length).ceil
  end
end
