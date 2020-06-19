require "board"
RSpec.describe Board do
    describe '#new' do
        it 'creates a new 3x3 grid' do
            expect(Board.new.board).to eq([[1,2,3], [4,5,6], [7,8,9]])
        end
    end

    # describe '#has_streak' do
    #     it 'returns true if there is a horizontal streak' do
    #         new_board = Board.new
    #         board = ["X", "X", "X", [4,5,6], [7,8,9]]
    #         expect()
    #     end
    # end
end