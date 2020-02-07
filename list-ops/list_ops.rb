# frozen_string_literal

# version 1

# class ListOps
#   def self.arrays(array)
#     count = 0

#     array.each { |_| count += 1 }

#     count
#   end

#   def self.reverser(array)
#     array.each_with_object([]) { |element, reversed| reversed.unshift element }
#   end

#   def self.concatter(*arrays)
#     arrays.each_with_object([]) { |array, concattinated| array.each { |element| concattinated << element } }
#   end

#   def self.mapper(array)
#     return array unless block_given?

#     array.each_with_object([]) { |element, mapped| mapped << yield(element) }
#   end

#   def self.filterer(array)
#     return array unless block_given?

#     array.each_with_object([]) { |element, mapped| mapped << element if yield(element) }
#   end

#   def self.sum_reducer(array)
#     sum = 0

#     array.each { |element| sum += element }

#     sum
#   end

#   def self.factorial_reducer(array)
#     product = 1

#     array.each { |element| product *= element }

#     product
#   end
# end

# version 2

class ListOps
  def self.arrays(array)
    count = 0

    until array.empty?
      count += 1
      array.pop
    end

    count
  end

  def self.reverser(array)
    new_array = []

    new_array << array.pop until array.empty?

    new_array
  end

  def self.concatter(array_1, array_2)
    array_1 << array_2.shift until array_2.empty?

    array_1
  end

  def self.mapper(array)
    return array unless block_given?

    new_array = []

    new_array << (yield array.shift) until array.empty?

    new_array
  end

  def self.filterer(array, &block)
    return array unless block_given?

    new_array = []

    until array.empty?
      element = array.shift

      new_array << element if yield element
    end

    new_array
  end

  def self.sum_reducer(array)
    sum = 0

    sum += array.pop until array.empty?

    sum
  end

  def self.factorial_reducer(array)
    product = 1

    product *= array.pop until array.empty?

    product
  end
end
