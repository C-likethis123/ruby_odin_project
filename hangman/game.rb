# frozen_string_literal: true

class Game
  def initialize
    @@FILENAME = 'data.txt'
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
    serialized = Marshal.dump(self)
    File.open(FILENAME, 'w') do |file|
      file.puts serialized
    end
  end

  def self.load_game
    game = File.read(@@FILENAME)
    Marshal.load(game)
    puts "Loaded game from #{@@FILENAME}"
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

  def prompt_user_input
    puts @blanks.to_s
    print "Guess a letter: "
    gets.chomp.downcase
  end

  def play
    while game_not_over
      user_guess = prompt_user_input
      if user_guess == 'save'
        save_game
      elsif guess_incorrect(user_guess)
        @tries -= 1
        puts "You've guessed wrongly! You have #{@tries} tries left\n"
      else
        puts "You've guessed correctly!"
        replace_blanks_with_user_guess(user_guess)
      end
      save_game
    end

    if @tries.zero?
      puts "You lost! The word is #{join_word(@word)}"
    else
      puts "You won! The word is #{join_word(@word)}. Play again?"
    end
  end
end

if Game.last_game?
  print 'Load the last game? (Y/N) '
  user_input = gets.chomp
  game = if user_input == 'Y'
           Game.load_game
         else
           Game.new
         end
else
  game = Game.new
end
game.play
