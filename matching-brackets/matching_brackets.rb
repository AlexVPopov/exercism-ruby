# frozen_string_literal: true

class Brackets
  PAIRS = { ']' => '[', ')' => '(', '}' => '{' }.freeze

  def self.paired?(str)
    str.gsub(/[^\[\]\(\)\{\}]/, '').chars.reduce([]) do |brackets, char|
      if %w_[ ( {_.include?(char)
        brackets << char
      else
        if brackets.pop == PAIRS[char]
          brackets
        else
          return false
        end
      end
    end.empty?
  end
end
