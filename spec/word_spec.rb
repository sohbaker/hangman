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

    expect(word.wrong_guesses).to eq('The answer was snack!')
  end

  it 'handles letters from different positions in the word' do
    word = Word.new('crazy')

    word.add_guess('c')
    word.add_guess('r')
    word.add_guess('y')

    expect(word.right_guesses).to eq("c r _ _ y \nMake another guess\n> ")
  end

  it 'returns true if not all letters guessed' do
    word = Word.new('crazy')

    word.add_guess('w')

    expect(word.is_not_guessed).to eq(true)
  end

  it 'can tell whether or not the user still has lives' do
    word = Word.new('crazy')

    word.add_guess('p')

    expect(word.can_still_play).to eq(true)
  end

  it 'tells the user the game is over after 5 wrong guesses' do
    word = Word.new('crazy')

    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')
    word.add_guess('f')
    word.add_guess('g')

    expect(word.can_still_play).to eq(false)
  end
end
