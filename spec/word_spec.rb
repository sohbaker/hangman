require 'word'

RSpec.describe Word do

  it 'returns true if not all letters guessed' do
    word = Word.new('')

    expect(word.is_not_guessed).to eq(true)
  end

  it 'can tell whether or not the user still has lives' do
    word = Word.new('')

    expect(word.can_still_play).to eq(true)
  end

end
