# frozen_string_literal

class RotationalCipher
  ALPHABET = [*'a'..'z'].freeze

  def self.rotate(text, rotations)
    text.tr (ALPHABET.join.upcase + ALPHABET.join),
            (ALPHABET.rotate(rotations).join.upcase + ALPHABET.rotate(rotations).join)
  end
end
