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

    if letters == @word.split('')
      puts "You have WON!"
      puts "The answer is #{@word}!"
    end
    letters
  end
    # @word.split('').map do |letter|
    #   '_'
  # end

end
