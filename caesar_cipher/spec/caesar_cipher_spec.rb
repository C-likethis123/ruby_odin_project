# frozen_string_literal: true

require 'caesar_cipher'

RSpec.describe 'Caesar' do
  it 'returns a string with every letter shifted by shift_factor' do
    expect(caesar_cipher('hello', 2)).to eq('jgnnq')
  end

  it 'returns the correct string with capital letters' do
    expect(caesar_cipher('Hello', 2)).to eq('Jgnnq')
  end

  it 'wraps around from a to z' do
    expect(caesar_cipher('Whatz', 5)).to eq('Bmfye')
  end

  it 'ignores punctuations' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
  end
end
