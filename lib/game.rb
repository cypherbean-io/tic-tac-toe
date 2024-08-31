# frozen_string_literal: true

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  def play
    x = 0
    @board.print_board
    until x == 9
      @current_player.make_move(@board)
      @board.print_board
      switch_players
      x += 1
    end
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
