# frozen_string_literal: true

class Array
  def accumulate(&block)
    return to_enum(__method__) unless block_given?
    each_with_object([]) { |element, accumulator| accumulator << yield(element) }
  end
end
