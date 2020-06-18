=begin
1. map to the ascii characters.
2. wrap around by using modulo
3. add to a string

65-90: "A" to "Z"
97-122: "a" to "z"
=end
class Caesar
    def get_letter_within_range(letter, shift_factor)
        ascii = letter.ord + shift_factor
        if (ascii > 90 && ascii < 97)
            return ((ascii % 90) + 64).chr
        elsif (ascii > 122)
            return ((ascii % 122) + 96).chr
        else
            return ascii.chr
        end
    end

    def caesar_cipher(string, shift_factor)
        result = ""
        string = string.split(//)
        for letter in string
            result += (get_letter_within_range(letter, shift_factor))
        end
        return result
    end
end
