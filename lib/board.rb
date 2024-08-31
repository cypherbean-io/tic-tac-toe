# frozen_string_literal: true

# Description/Explanation: Creates a board to be used in a tic-tac-toe game. The board is a 3x3 grid that is printed to
# the console. The board is initialized with empty cells, and the print_board method prints the board to the console.
# The board is created using a 2D array, where each cell is represented by a nil value. The print_board method iterates
# over each row of the board and prints the cell values separated by a pipe character. It also prints a horizontal line
# between each row to separate them visually.
class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def print_board
    @board.each_with_index do |row, index|
      puts row.map { |cell| cell || ' ' }.join('|')
      puts '-----' unless index == @board.size - 1
    end
  end

  def valid_move?(move)
    move.is_a?(Array) && move.size == 2 && move.all? { |coord| coord.is_a?(Integer) && coord.between?(0, 2) }
  end

  def empty_cell?(move)
    @board[move[0]][move[1]].nil?
  end

  def place_symbol(move, symbol)
    @board[move[0]][move[1]] = symbol if move.empty_cell?
  end
end
