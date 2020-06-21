# frozen_string_literal: true

def select_word
  contents = File.readlines('words.txt')
  selected_word = contents.sample
  selected_word = contents.sample while selected_word.length < 5 || selected_word.length > 12
  selected_word.chomp.downcase
end

def initialize_game
    $word = select_word.split(//)
    $incorrect_guesses = 0
    $tries = 5
    $blanks = ["_"] * $word.length
end

def game_not_over
    return $blanks.any? {|blank| blank == "_" } && $tries > 0
end

def guess_incorrect(user_guess)
    return $word.none? { |word| word == user_guess }
end

def replace_blanks_with_user_guess(user_guess)
    $word.each_with_index do |letter, index|
        if letter == user_guess
            $blanks[index] = user_guess
        end
    end
end

initialize_game
puts "initialized"
while game_not_over
    print $blanks
    print "Guess a letter: "
    user_guess = gets.chomp
    if guess_incorrect(user_guess)
        $incorrect_guesses += 1
        $tries -= 1
        puts "You've guessed wrongly! You have #{$tries} left"
        puts "Incorrect guesses: #{$incorrect_guesses}"
    else
        puts "You've guessed correctly!"
        replace_blanks_with_user_guess(user_guess)  
        print $blanks
    end
end