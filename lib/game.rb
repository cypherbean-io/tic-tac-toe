# frozen_string_literal: true

# Description/Explanation: Creates a game object to be used in a tic-tac-toe game. The game object is initialized with a
# board, two players, and the current player. The play method is used to start the game loop, which continues until the
# game is over. The game loop consists of players making moves on the board, switching turns, and checking for a winning
# combination or a draw. The game object also has a switch_players method to alternate between players, a game_over?
# method to check if the game is over, and a play method to start the game loop.
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  def play
    @board.print_board
    until game_over?
      @current_player.make_move(@board)
      @board.print_board
      break if game_over?

      switch_players
    end
    puts "Game over! #{@current_player.name} wins!" if @board.winning_combination?(@current_player)
    puts "Game over! It's a draw!" if @board.full? && !@board.winning_combination?(@current_player)
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def game_over?
    @board.winning_combination?(@current_player) || @board.full?
  end
end
