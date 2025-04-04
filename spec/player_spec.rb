# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Player do
  subject(:player) { Player.new('Player 1', 'X') }
  subject(:board) { Board.new }

  describe '#get_move' do
    it 'prompts the player for a move' do
      allow(player).to receive(:gets).and_return('1,2')
      expect(player.get_move(board)).to eq([1, 2])
    end

    it 'validates the move' do
      allow(player).to receive(:gets).and_return('3,4', '1,2')
      expect(player.get_move(board)).to eq([1, 2])
    end
  end

  describe '#make_move' do
    it 'places the player\'s symbol on the board' do
      allow(player).to receive(:gets).and_return('1,2')
      player.make_move(board)
      expect(board.instance_variable_get(:@board)[1][2]).to eq('X')
    end

    it 'prompts for a new move if the cell is not empty' do
      board.place_symbol([1, 2], 'O')
      allow(player).to receive(:gets).and_return('1,2', '0,0')
      player.make_move(board)
      expect(board.instance_variable_get(:@board)[0][0]).to eq('X')
    end
  end
end
