require 'word'

RSpec.describe Word do
  it 'returns "wrong answer" if the guess is incorrect' do
    word = Word.new('snack')

    word.add_guess('g')

    expect(word.wrong_guesses).to eq("\nWrong answer. You lose one life! :(\nMake another guess\n> ")
  end

  it 'can handle incorrect guess followed by correct guess' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('a')

    expect(word.right_guesses).to eq("_ _ a _ _ \nMake another guess\n> ")
  end

  it 'tells the user when they\'ve run out of guesses' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('l')
    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')
    word.add_guess('q')

    expect(word.wrong_guesses).to eq('The answer was snack!')
  end

end
