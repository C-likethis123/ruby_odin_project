# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize
    @board = Board.new
    @player_X = Player.new('X')
    @player_O = Player.new('O')
    @current_player = [@player_X, @player_O].sample
  end

  def announce_winner(current_player)
    puts "Player #{current_player} won! Play again?"
  end

  def announce_draw
    puts "It's a tie!"
  end

  def switch_player
    @current_player = @current_player == @player_X ? @player_O : @player_X
  end

  def play
    loop do
      puts "It's Player #{@current_player}'s turn"
      @current_player.makes_move(@board)
      if @board.streak?
        announce_winner(@current_player)
        break
      elsif @board.all_grids_filled?
        announce_draw
        break
      else
        switch_player
      end
    end
  end
end

game = Game.new
game.play
