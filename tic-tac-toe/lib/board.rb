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

  def streak?
    # checks horizonal streaks
    (0..2).each do |row|
      first_element = board[row * 3]
      return true if board[row * 3 + 1] == first_element && board[row * 3 + 2] == first_element
    end

    # checks vertical streaks
    (0..2).each do |column|
      first_element = board[column]
      return true if board[column + 3] == first_element && board[column + 6] == first_element
    end

    # checks diagonals
    return true if board[0] == board[4] && board[0] == board[8]

    return true if board[2] == board[4] && board[2] == board[6]

    false
  end
end
