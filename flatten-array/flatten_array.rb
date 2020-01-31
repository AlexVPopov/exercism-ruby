# frozen_string_literal

class FlattenArray
  def self.flatten(array)
    array.reduce([]) { |acc, item| acc.push *(item.is_a?(Array) ? flatten(item) : item) }
  end
end
