# frozen_string_literal: true

# 1. map to the ascii characters.
# 2. wrap around by using modulo
# 3. add to a string
#
# 65-90: "A" to "Z"
# 97-122: "a" to "z"
def is_punctuation(letter)
  ascii = letter.ord
  ascii < 65 || (ascii > 90 && ascii < 97) || ascii > 122
end

def get_letter_within_range(letter, shift_factor)
  return letter if is_punctuation(letter)

  ascii = letter.ord + shift_factor
  if ascii > 90 && ascii < 97
    ((ascii % 90) + 64).chr
  elsif ascii > 122
    ((ascii % 122) + 96).chr
  else
    ascii.chr
  end
end

def caesar_cipher(string, shift_factor)
  result = ''
  string = string.split(//)
  string.each do |letter|
    result += get_letter_within_range(letter, shift_factor)
  end
  result
end
