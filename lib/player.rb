# frozen_string_literal: true

require 'pry-byebug'

# Description/Explanation: Creates a player object to be used in a tic-tac-toe game. The player object has a name and a
# symbol, which is used to represent the player's moves on the board. The player object is initialized with a name and a
# symbol, and it has read-only access to these attributes through the name and symbol methods.
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def get_move(board)
    print "#{@name}, enter your move (row, column): "
    move = gets.chomp.split(',').map(&:to_i)
    until board.valid_move?(move)
      print 'Invalid move. Enter your move (row, column): '
      move = gets.chomp.split(',').map(&:to_i)
    end
    move
  end

  def make_move(board)
    move = get_move(board)
    until board.empty_cell?(move)
      puts 'Cell is not empty. Try again.'
      move = get_move(board)
    end
    board.place_symbol(move, @symbol)
  end
end
