# frozen_string_literal: true

require 'board'
RSpec.describe Board do
  describe '#new' do
    it 'creates a new 3x3 grid' do
      expect(Board.new.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#add_to_grid' do
    it 'updates the board array' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      expect(new_board.board).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])

      new_board.add_to_grid('O', 7)
      expect(new_board.board).to eq(['X', 2, 3, 4, 5, 6, 'O', 8, 9])
    end

    it 'raises an error when attempting to add to an occupied grid' do
      expect do
        new_board = Board.new
        new_board.add_to_grid('X', 1)
        new_board.add_to_grid('O', 1)
      end .to raise_error(RuntimeError, 'Grid 1 is already occupied! Choose an unoccupied grid')
    end

    it 'raises an error when attempting to add an invalid input' do
      expect do
        new_board = Board.new
        new_board.add_to_grid('X', 10)
      end .to raise_error(RuntimeError, 'The input(10) is not valid. Choose an input from the valid range (1-9)')
    end
  end

  describe '#streak?' do
    it 'returns true when there is a horizontal streak' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('X', 2)
      new_board.add_to_grid('X', 3)
      expect(new_board.streak?).to eq(true)
    end

    it 'returns true when there is a vertical streak' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('X', 4)
      new_board.add_to_grid('X', 7)
      expect(new_board.streak?).to eq(true)
    end

    it 'returns true when there is a diagonal streak' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('X', 5)
      new_board.add_to_grid('X', 9)
      expect(new_board.streak?).to eq(true)
    end

    it 'returns false when there is no streak' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('X', 9)
      expect(new_board.streak?).to eq(false)
    end
  end

  describe '#all_grids_filled?' do
    it 'returns true when all grids are filled' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('O', 2)
      new_board.add_to_grid('X', 3)
      new_board.add_to_grid('O', 4)
      new_board.add_to_grid('X', 5)
      new_board.add_to_grid('O', 6)
      new_board.add_to_grid('X', 7)
      new_board.add_to_grid('O', 8)
      new_board.add_to_grid('X', 9)
      expect(new_board.all_grids_filled?).to eq(true)
    end

    it 'returns false when not all grids are filled' do
      new_board = Board.new
      new_board.add_to_grid('X', 1)
      new_board.add_to_grid('O', 2)
      new_board.add_to_grid('O', 4)
      new_board.add_to_grid('X', 5)
      new_board.add_to_grid('O', 6)
      new_board.add_to_grid('X', 7)
      new_board.add_to_grid('O', 8)
      new_board.add_to_grid('X', 9)
      expect(new_board.all_grids_filled?).to eq(false)
    end
  end
end
