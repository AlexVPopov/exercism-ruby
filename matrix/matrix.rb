# frozen_string_literal: true

class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @rows ||= matrix.split("\n").map { |row| row.split("\s").map(&:to_i) }
  end

  # version 1

  def columns
    rows.first.zip(*rows[1..-1])
  end

  # version 2

  # def columns
  #   rows.transpose
  # end

  private

  attr_reader :matrix
end
