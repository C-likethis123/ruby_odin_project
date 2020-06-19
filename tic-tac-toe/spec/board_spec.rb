# frozen_string_literal: true

require 'board'
RSpec.describe Board do
  describe '#new' do
    it 'creates a new 3x3 grid' do
      expect(Board.new.board).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

end
