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

  it 'adds another letter to the current word' do
    word = Word.new('hello')

    word.add_guess('h')
    word.add_guess('e')

    expect(word.guessed_letters).to eq(['h', 'e', '_', '_', '_'])
  end

  it 'adds another letter to the current word in the right position' do
    word = Word.new('hello')

    word.add_guess('h')
    word.add_guess('e')
    word.add_guess('o')

    expect(word.guessed_letters).to eq(['h', 'e', '_', '_', 'o'])
  end

  it 'adds another letter to the current word in the right position' do
    word = Word.new('hello')

    word.add_guess('h')
    word.add_guess('e')
    word.add_guess('o')
    word.add_guess('l')

    expect(word.guessed_letters).to eq(['h', 'e', 'l', 'l', 'o'])
  end

  it 'tells the user they have won when they\'ve guessed the full word' do
    word = Word.new("hello")

    word.add_guess('h')
    word.add_guess('e')
    word.add_guess('o')
    word.add_guess('l')

    expect(word.guessed_letters).to eq(['h', 'e', 'l', 'l', 'o'])
  end

  # it 'returns nothing if the guess is incorrect' do
  #   word = Word.new('hello')
  #
  #   word.add_guess('k')
  #
  #   expect(word.guessed_letters).to eq(['_', '_', '_', '_', '_'])
  # end
  #
end
