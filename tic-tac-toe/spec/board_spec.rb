# frozen_string_literal: true

require 'board'
RSpec.describe Board do
  def new_board(arr)
    board = Board.new
    arr.each_with_index { |elem, index| board.add_to_grid(elem, index + 1) if elem.instance_of?(String) }
    board
  end

  describe '#new' do
    it 'creates a new 3x3 grid' do
      expect(Board.new.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#add_to_grid' do
    it 'updates the board array' do
      board = Board.new
      board.add_to_grid('X', 1)
      expect(board.board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])

      board.add_to_grid('O', 7)
      expect(board.board).to eq(['X', 2, 3, 4, 5, 6, 'O', 8, 9])
    end

    it 'raises an error when attempting to add to an occupied grid' do
      expect do
        board = new_board(['X', 2, 3, 4, 5, 6, 7, 8, 9])
        board.add_to_grid('O', 1)
      end .to raise_error(RuntimeError, 'Grid 1 is already occupied! Choose an unoccupied grid')
    end

    it 'raises an error when attempting to add an invalid input' do
      expect do
        board = Board.new
        board.add_to_grid('X', 10)
      end .to raise_error(RuntimeError, 'The input(10) is not valid. Choose an input from the valid range (1-9)')
    end
  end

  describe '#streak?' do
    it 'returns true when there is a horizontal streak' do
      board = new_board(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      expect(board.streak?).to eq(true)
    end

    it 'returns true when there is a vertical streak' do
      board = Board.new
      board = new_board(['X', 2, 3, 'X', 5, 6, 'X', 8, 9])
      expect(board.streak?).to eq(true)
    end

    it 'returns true when there is a diagonal streak' do
      board = new_board(['X', 2, 3, 4, 'X', 6, 7, 8, 'X'])
      expect(board.streak?).to eq(true)
    end

    it 'returns false when there is no streak' do
      board = new_board(['X', 2, 3, 4, 5, 6, 7, 8, 'X'])
      expect(board.streak?).to eq(false)
    end
  end

  describe '#all_grids_filled?' do
    it 'returns true when all grids are filled' do
      board = new_board(%w[X O X O X O X O X])
      expect(board.all_grids_filled?).to eq(true)
    end

    it 'returns false when not all grids are filled' do
      board = new_board(['X', 'O', 3, 'O', 'X', 'O', 'X', 'O', 'X'])
      expect(board.all_grids_filled?).to eq(false)
    end
  end
end
