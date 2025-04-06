# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  subject(:board) { Board.new }

  describe '#print_board' do
    it 'prints the board' do
      expect { board.print_board }.to output(" | | \n-----\n | | \n-----\n | | \n").to_stdout
    end
  end

  describe '#valid_move?' do
    it 'returns true for a valid move' do
      expect(board.valid_move?([1, 2])).to be true
    end

    it 'returns false for an invalid move' do
      expect(board.valid_move?([3, 4])).to be false
    end
  end

  describe '#empty_cell?' do
    it 'returns true for an empty cell' do
      expect(board.empty_cell?([1, 2])).to be true
    end

    it 'returns false for a non-empty cell' do
      board.place_symbol([1, 2], 'X')
      expect(board.empty_cell?([1, 2])).to be false
    end
  end

  describe '#place_symbol' do
    it 'places a symbol on the board' do
      board.place_symbol([1, 2], 'X')
      expect(board.instance_variable_get(:@board)[1][2]).to eq('X')
    end
  end

  describe '#full?' do
    it 'returns true if the board is full' do
      board.place_symbol([0, 0], 'X')
      board.place_symbol([0, 1], 'O')
      board.place_symbol([0, 2], 'X')
      board.place_symbol([1, 0], 'O')
      board.place_symbol([1, 1], 'X')
      board.place_symbol([1, 2], 'O')
      board.place_symbol([2, 0], 'X')
      board.place_symbol([2, 1], 'O')
      board.place_symbol([2, 2], 'X')
      expect(board.full?).to be true
    end
  end

  describe '#winning_combination?' do
    let(:player) { instance_double('Player', symbol: 'X') }

    context 'when there is a winning combination' do
      it 'returns true for a row win' do
        board.place_symbol([0, 0], 'X')
        board.place_symbol([0, 1], 'X')
        board.place_symbol([0, 2], 'X')
        expect(board.winning_combination?(player)).to be true
      end

      it 'returns true for a column win' do
        board.place_symbol([0, 0], 'X')
        board.place_symbol([1, 0], 'X')
        board.place_symbol([2, 0], 'X')
        expect(board.winning_combination?(player)).to be true
      end

      it 'returns true for a diagonal win' do
        board.place_symbol([0, 0], 'X')
        board.place_symbol([1, 1], 'X')
        board.place_symbol([2, 2], 'X')
        expect(board.winning_combination?(player)).to be true
      end
    end

    context 'when there is no winning combination' do
      it 'returns false' do
        board.place_symbol([0, 0], 'X')
        board.place_symbol([1, 1], 'O')
        board.place_symbol([2, 2], 'X')
        expect(board.winning_combination?(player)).to be false
      end
    end
  end
end
