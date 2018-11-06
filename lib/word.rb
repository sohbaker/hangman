class Word
  def initialize(word)
    @word = word
    @user_guesses = []
  end

  def add_guess(letter)
    @user_guesses.push(letter)
  end

  def guessed_letters
    # ['_', '_', '_', '_', '_']
    letters = []
    @word.split('').each do |letter|
      if @user_guesses.include?(letter)
        letters.push(letter)
      else
        letters.push('_')
      end
    end
    # @word.split('').map do |letter|
    #   '_'
    letters
  end
end
