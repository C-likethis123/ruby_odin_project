# frozen_string_literal: true

class Board
  attr_reader :board
  def initialize
    @board = [*(1..9)]
  end

  def print_board
    board_string = "/---|---|---\\\n" \
                   "| #{board[0]} | #{board[1]} | #{board[2]} |\n" \
                   "|-----------|\n" \
                   "| #{board[3]} | #{board[4]} | #{board[5]} |\n" \
                   "|-----------|\n" \
                   "| #{board[6]} | #{board[7]} | #{board[8]} |\n" \
                   "/---|---|---\\\n"

    puts board_string
  end

  def add_to_grid(player_symbol, position)
    @board[position - 1] = player_symbol
  end
end
