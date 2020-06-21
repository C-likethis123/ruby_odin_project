# frozen_string_literal: true

def select_word
  contents = File.readlines('words.txt')
  selected_word = contents.sample
  selected_word = contents.sample while selected_word.length < 5 || selected_word.length > 12
  selected_word
end

def initialize_game
    $word = select_word
    $incorrect_guesses = 0
    $blanks = ["_"] * $word.length
end

print initialize_game