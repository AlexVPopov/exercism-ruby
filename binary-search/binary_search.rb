# frozen_string_literal

class BinarySearch
  def initialize(arr)
    @arr = arr
  end

  def search_for(el, current_position = arr.count / 2, limit = arr.count - 1)
    puts "final position: #{arr.index(el)}"
    puts "arr length: #{arr.count}"
    puts "current position: #{current_position}"
    puts '======================================'

    return unless (0..arr.count - 1).cover?(current_position)

    return current_position if arr[current_position] == el

    return if current_position.zero? || current_position == arr.count - 1

    new_current_position =
      if arr[current_position] > el
        current_position / 2
      else
        current_position + (limit - current_position) / 2
      end

    raise StandardError if current_position == new_current_position

    search_for(el, new_current_position, current_position)
  end

  private

  attr_reader :arr
end

# BinarySearch.new([1, 3, 4, 6, 8, 9, 11]).search_for(6)
