# frozen_string_literal: true

def select_word
  contents = File.readlines('words.txt')
  selected_word = contents.sample
  selected_word = contents.sample while selected_word.length < 5 || selected_word.length > 12
  selected_word
end

puts select_word