# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#switch_players' do
    it 'switches the current player' do
      initial_player = game.instance_variable_get(:@current_player)
      game.switch_players
      expect(game.instance_variable_get(:@current_player)).not_to eq(initial_player)
    end
  end

  describe '#game_over?' do
    it 'returns true if the game is over' do
      allow(game.instance_variable_get(:@board)).to receive(:winning_combination?).and_return(true)
      expect(game.game_over?).to be true
    end

    it 'returns false if the game is not over' do
      allow(game.instance_variable_get(:@board)).to receive(:winning_combination?).and_return(false)
      allow(game.instance_variable_get(:@board)).to receive(:full?).and_return(false)
      expect(game.game_over?).to be false
    end
  end
end
