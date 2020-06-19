# frozen_string_literal: true

class Board
  attr_reader :board
  def initialize
    @board = [[*(1..3)], [*(4..6)], [*(7..9)]]
  end
end
