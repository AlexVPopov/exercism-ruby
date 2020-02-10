# frozen_string_literal

class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |s| "#{s.length}#{s[0]}" }
  end

  def self.decode(input)
    input.gsub(/\d+./) { |match| match[-1] * match.to_i}
  end
end
