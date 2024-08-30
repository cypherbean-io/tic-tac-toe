# frozen_string_literal: true

# Description/Explanation: Creates a player object to be used in a tic-tac-toe game. The player object has a name and a
# symbol, which is used to represent the player's moves on the board. The player object is initialized with a name and a
# symbol, and it has read-only access to these attributes through the name and symbol methods.
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
