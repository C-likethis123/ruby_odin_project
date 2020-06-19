# frozen_string_literal: true

require 'player'
require 'board'
RSpec.describe Player do
  describe '#makes_move' do
    it 'updates the board array' do
      new_board = Board.new
      new_player = Player.new('X')

      orig_stdin = $stdin
      $stdin = StringIO.new('1')

      new_player.makes_move(new_board)
      expect(new_board.board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])

      player_O = Player.new('O')
      $stdin = StringIO.new('7')
      player_O.makes_move(new_board)
      expect(new_board.board).to eq(['X', 2, 3, 4, 5, 6, 'O', 8, 9])
      $stdin = orig_stdin
    end
  end
end
