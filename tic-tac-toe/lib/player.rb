# frozen_string_literal: true

class Player
  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def makes_move(board)
    board.print_board
    puts 'Enter the grid position you want to make your move in:'
    position = gets.to_i
    board.add_to_grid(@player_symbol, position)
  end

  def to_s
    @player_symbol
  end
end
