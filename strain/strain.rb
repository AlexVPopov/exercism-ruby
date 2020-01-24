# frozen_string_literal: true

class Array
  def keep
    return to_enum(__method__) unless block_given?
    each_with_object([]) { |element, accumulator| accumulator << element if yield(element) }
  end

  def discard
    return to_enum(__method__) unless block_given?
    each_with_object([]) { |element, accumulator| accumulator << element unless yield(element) }
  end
end
