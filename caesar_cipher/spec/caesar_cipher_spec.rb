require "caesar_cipher"

RSpec.describe Caesar do
    it 'returns a string with every letter shifted by shift_factor' do
        expect(Caesar.new.caesar_cipher("hello", 2)).to eq("jgnnq")
    end

    it 'returns the correct string with capital letters' do
        expect(Caesar.new.caesar_cipher("Hello", 2)).to eq("Jgnnq")
    end

    it 'wraps around from a to z' do
        expect(Caesar.new.caesar_cipher("Whatz", 5)).to eq("Bmfye")
    end

    it 'ignores punctuations' do
        expect(Caesar.new.caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
    end
end