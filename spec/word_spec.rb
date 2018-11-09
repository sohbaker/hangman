require 'word'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe Word do
let(:word_gen)    { CleanWords::Random.new }

  before do
    allow_any_instance_of(CleanWords::Random).to receive(:fetch).and_return("snack")
  end

# RSpec.describe Word do
  it 'can handle incorrect guess followed by correct guess' do
    word_gen = Word.new('snack')

    word_gen.add_guess('g')
    word_gen.add_guess('a')

    expect(word_gen.right_guesses).to eq("Hint: _ _ a _ _\nThese letters are incorrect: g\nMake another guess\n> ")
  end

  it 'handles letters from different positions in the word' do
    word_gen = Word.new(" ")

    word_gen.add_guess('s')
    word_gen.add_guess('n')
    word_gen.add_guess('k')

    expect(word_gen.right_guesses).to eq("Hint: s n _ _ k\nThese letters are incorrect: \nMake another guess\n> ")
  end

  it 'returns true if not all letters guessed' do
    word = Word.new('snack')

    word.add_guess('w')

    expect(word.is_not_guessed).to eq(true)
  end

  it 'can tell whether or not the user still has lives' do
    word = Word.new('snack')

    word.add_guess('p')

    expect(word.can_still_play).to eq(true)
  end

  it 'tells the user the game is over after 5 wrong guesses' do
    word = Word.new('snack')

    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')
    word.add_guess('f')
    word.add_guess('g')

    expect(word.can_still_play).to eq(false)
  end

  it 'tells the user what letters aren\'t in the word' do
    word = Word.new('snack')

    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')

    expect(word.wrong_guesses).to eq("\nWrong answer! \nThese letters are incorrect: b,d,e.\nYou lose one life! \u{1F614} |Lives left: 2|\nMake another guess\n> ")
  end

  it 'overwrites random word generator, so that tests are still valid' do
    word = Word.new('snack')

    word.add_guess('s')
    word.add_guess('n')
    word.add_guess('a')
    word.add_guess('c')
    word.add_guess('k')

    expect(word.right_guesses).to eq("\nYou have WON!\u{1F389}\u{1F3C6}\nThe answer is snack!\n")
  end

  it "tells the user they have lost all their lives, but can play again" do
    word = Word.new('snack')

    word.add_guess('b')
    word.add_guess('d')
    word.add_guess('e')
    word.add_guess('f')
    word.add_guess('g')

    expect(word.play_again).to eq("YOU LOSE! \u{26B0}\u{1F622}\nThe word was snack.\nWould you like to play again? ('Yes' or 'No')\n> ")
  end

end
