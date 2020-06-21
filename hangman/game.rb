# frozen_string_literal: true

class Game
  def initialize
    @word = select_word.split(//)
    @tries = 10
    @blanks = ['_'] * @word.length
  end

  def select_word
    contents = File.readlines('words.txt')
    selected_word = contents.sample
    selected_word = contents.sample while selected_word.length < 5 || selected_word.length > 12
    selected_word.chomp.downcase
  end

  def self.last_game?
    load_game.instance_of?(Game)
  rescue StandardError
    puts "Can't load the last game, starting a new game..."
    false
  end

  def save_game
    serialized = YAML::dump(self)
    filename = 'data.txt'
    File.open(filename, 'w') do |file|
      file.puts serialized
    end
end

  def self.load_game
    filename = 'data.txt'
    game = File.read(filename)
    serialized = YAML.safe_load(game)
  end

  def game_not_over
    @blanks.any? { |blank| blank == '_' } && @tries.positive?
  end

  def guess_incorrect(user_guess)
    @word.none? { |word| word == user_guess }
  end

  def replace_blanks_with_user_guess(user_guess)
    @word.each_with_index do |letter, index|
      @blanks[index] = user_guess if letter == user_guess
    end
  end

  def join_word(word)
    word.join('')
  end

  def play
    while game_not_over
      puts @blanks.to_s
      print 'Guess a letter: '
      user_guess = gets.chomp.downcase
      if guess_incorrect(user_guess)
        @tries -= 1
        puts "You've guessed wrongly! You have #{@tries} tries left\n"
      else
        puts "You've guessed correctly!"
        replace_blanks_with_user_guess(user_guess)
      end
    end

    if @tries.zero?
      puts "You lost! The word is #{join_word(@word)}"
    else
      puts "You won! The word is #{join_word(@word)}. Play again?"
    end
  end
end

game = Game.new
game.play
