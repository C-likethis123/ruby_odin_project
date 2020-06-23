# frozen_string_literal: true

require 'game'

# RSpec.configure do |config|
#   config.mock_with :rspec # use rspec-mocks
# end

RSpec.describe Game do
  describe '#play - positive test cases' do
    it 'announces winner when there is a streak' do
      # mock a game with a filled board
      filled_board = %w[X O X O X O X O X]
      Board.any_instance.stub(board: filled_board)
      Player.any_instance.stub(:makes_move)

      game = Game.new
      expect(game).to receive(:announce_winner)
      game.play
    end

    it 'announces draw when board is filled' do
      # mock a game with a filled board
      filled_board = %w[X O X O X X O X O]
      Board.any_instance.stub(board: filled_board)
      Player.any_instance.stub(:makes_move)
      game = Game.new
      expect(game).to receive(:announce_draw)
      game.play
    end
  end
end
