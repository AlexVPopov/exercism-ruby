# frozen_string_literal

require 'break'

class Board
  attr_reader :board

  def initialize(board)
    @board = board.map { |row| row.scan(/\S/) }
  end

  def winner
    return 'O' if ResultChecker.new('O', board).winner?
    return 'X' if ResultChecker.new('X', board.transpose).winner?
    ''
  end
end

class ResultChecker
  def initialize(player, board, visited_positions = [])
    @player = player
    @board = board
    @visited_positions = visited_positions
  end

  def winner?
    row, column = visited_positions.last

    return true if row == board.count - 1

    next_positions(row, column).any? do |position|
      self.class.new(player, board, [*visited_positions, position]).winner?
    end
  end

  private

  attr_reader :player, :board, :visited_positions

  def next_positions(row, column)
    return first_row_positions unless row

    surrounding_positions(row, column).select do |row, column|
      !visited_positions.include?([row, column]) && board[row][column] == player
    end
  end

  def surrounding_positions(row, column)
    [[row - 1, column],
     [row - 1, column + 1],
     [row, column - 1],
     [row, column + 1],
     [row + 1, column - 1],
     [row + 1, column]].select do |row, column|
       (0...board.count).cover?(row) && (0...board.first.count).cover?(column)
     end
  end

  def first_row_positions
    [0].product([*0...board.count]).select { |row, column| board[row][column] == player }
  end
end
