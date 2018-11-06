require 'word'

RSpec.describe Word do
  it 'returns the guessed letters' do
    word = Word.new('hello')

    guessed_letters = word.guessed_letters

    expect(guessed_letters).to eq(['_', '_', '_', '_', '_'])
  end

  it 'returns empty letters for different lengths of word' do
    word = Word.new('blackberry')

    guessed_letters = word.guessed_letters

    expect(guessed_letters).to eq(['_', '_', '_', '_', '_', '_', '_', '_', '_', '_'])
  end

  it 'adds a letter to the current word' do
    word = Word.new('hello')

    word.add_guess('h')

    expect(word.guessed_letters).to eq(['h', '_', '_', '_', '_'])
  end

end
