require 'word'

RSpec.configure do |config|
  config.mock_with :rspec
end

describe Word do
let(:word_gen)    { CleanWords::Random.new }

  before do
    allow_any_instance_of(CleanWords::Random).to receive(:fetch).and_return("snack")
  end
  # context "GET new word" do
  #   # let(:response) { get "snack" }
  #
  #   it "returns the specified word rather than a random one" do
  #     expect(initialize.word).to eq('snack')
  #   end
  # end

  it 'can handle incorrect guess followed by correct guess' do
    word_gen = Word.new('snack')

    word_gen.add_guess('g')
    word_gen.add_guess('a')

    expect(word_gen.right_guesses).to eq("Hint: _ _ a _ _\nThese letters are incorrect: g\nMake another guess\n> ")
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

    expect(word.wrong_guesses).to eq("\nWrong answer! These letters are incorrect: b,d,e.\nYou lose one life! :(\nMake another guess\n> ")
  end

  it 'overwrites random word generator, so that tests are still valid' do
    word = Word.new('snack')

    word.add_guess('s')
    word.add_guess('n')
    word.add_guess('a')
    word.add_guess('c')
    word.add_guess('k')

    expect(word.right_guesses).to eq("\nYou have WON!\nThe answer is snack!\n")
  end

  # it "returns the specified word rather than a random one" do
  #   # word_gen = Word.new()
  #
  #   word_gen.stub(:message) { 'snack' }
  #   word_gen.message.should eq('snack')
  #
  #   # allow_any_instance_of(Word).to receive(word_gen).and_return('snack')
  #   # CleanWords::Random.any_instance.stub(:foo).and_return('snack')
  #
  #   # word_gen = CleanWords::Random.new
  #   # word_gen.foo.should eq('snack')
  # end
  # end
end
