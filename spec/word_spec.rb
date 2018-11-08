require 'word'

RSpec.describe Word do

  it 'can handle incorrect guess followed by correct guess' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('a')

    expect(word.right_guesses).to eq("Hint: _ _ a _ _\nThese letters aren\'t in the word: g\nMake another guess\n> ")
  end

  it 'tells the user when they\'ve run out of guesses' do
    word = Word.new('snack')

    word.add_guess('g')
    word.add_guess('l')
    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')

    expect(word.wrong_guesses).to eq('YOU LOSE! The answer was snack!')
  end

  it 'handles letters from different positions in the word' do
    word = Word.new('crazy')

    word.add_guess('c')
    word.add_guess('r')
    word.add_guess('y')

    expect(word.right_guesses).to eq("Hint: c r _ _ y\nThese letters aren't in the word: \nMake another guess\n> ")
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

  it 'tells the user what letters aren\'t in the word' do
    word = Word.new('crazy')

    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')

    expect(word.wrong_guesses).to eq("\nWrong answer! These letters aren\'t in the word: b,d,e.\nYou lose one life! :(\nMake another guess\n> ")
  end
end
