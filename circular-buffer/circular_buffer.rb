# frozen_string_literal: true

class CircularBuffer
  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?

    buffer.shift
  end

  def clear
    self.buffer = []
  end

  def write(item)
    raise BufferFullException if full?

    buffer.push(item)
  end

  def write!(item)
    read if full?

    write(item)
  end

  private

  def full?
    buffer.size == size
  end

  attr_reader :size

  attr_accessor :buffer
end
