require 'word'

RSpec.describe Word do
#----right answer
  # it 'returns the guessed letters' do
  #   word = Word.new('hello')
  #
  #   guessed_letters = word.guessed_letters
  #
  #   expect(guessed_letters).to eq(['_', '_', '_', '_', '_'])
  # end
  #
  # it 'returns empty letters for different lengths of word' do
  #   word = Word.new('blackberry')
  #
  #   guessed_letters = word.guessed_letters
  #
  #   expect(guessed_letters).to eq(['_', '_', '_', '_', '_', '_', '_', '_', '_', '_'])
  # end
  #
  # it 'adds a letter to the current word' do
  #   word = Word.new('hello')
  #
  #   word.add_guess('h')
  #
  #   expect(word.guessed_letters).to eq(['h', '_', '_', '_', '_'])
  # end
  #
  # it 'adds a letter to the current word in the right position' do
  #   word = Word.new('hello')
  #
  #   word.add_guess('h')
  #   word.add_guess('e')
  #   word.add_guess('o')
  #
  #   expect(word.guessed_letters).to eq(['h', 'e', '_', '_', 'o'])
  # end
  #
  # it 'tells the user they have won when they\'ve guessed the full word' do
  #   word = Word.new("hello")
  #
  #   word.add_guess('h')
  #   word.add_guess('e')
  #   word.add_guess('o')
  #   word.add_guess('l')
  #
  #   expect(word.guessed_letters).to eq(['h', 'e', 'l', 'l', 'o'])
  # end
# ----wrong answer
  it 'returns empty array if the guess is incorrect' do
    word = Word.new('snack')

    word.add_guess('g')

    expect(word.guessed_letters).to eq(['_', '_', '_', '_', '_'])
  end

  it 'can handle incorrect guess followed by correct guess' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('a')

    expect(word.guessed_letters).to eq(['_', '_', 'a', '_', '_'])
  end

  it 'tells the user when they\'ve run out of guesses' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('l')
    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')

    expect(word.guessed_letters).to eq(['_', '_', '_', '_', '_'])
  end

end
