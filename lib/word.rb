require 'clean_words'

class Word

  def initialize(word)
    word_gen = CleanWords::Random.new
    @word = word_gen.fetch
    # p @word
    @word_as_array = word.split('')
    @user_guesses = []
    @not_in_word = []
    @lives = 5

    hint = @word.size
    print "Welcome to Hangman!\n"
    print "The word is "
    print "_ " * hint
    print "\nMake a guess to start the game"
    print "\n> "
  end

  def add_guess(guess)
    if @word.include?(guess)
      @user_guesses.push(guess)
      right_guesses()
    else
      @not_in_word.push(guess)
      wrong_guesses()
    end
  end

  def right_guesses()
    correct_guesses = []

    @word_as_array.each do |letter|
      if @user_guesses.include?(letter)
        correct_guesses.push(letter)
      else
        correct_guesses.push('_')
      end
    end

    if correct_guesses == @word_as_array
      return "\nYou have WON!\nThe answer is #{@word}!\n"
    end
    return "Hint: #{correct_guesses.join(' ')}\nThese letters aren\'t in the word: #{@not_in_word.join(', ')}\nMake another guess\n> "
  end

  def wrong_guesses()
    if @not_in_word.count >= 1 && @lives >= 1
      @lives = @lives - 1
      p @lives
      return "\nWrong answer! These letters aren\'t in the word: #{@not_in_word.join(',')}.\nYou lose one life! :(\nMake another guess\n> "
    end

    if @lives == 0
      return "YOU LOSE! The answer was #{@word}!"
    end
  end

  def is_not_guessed
    @word_as_array.all? { |letter| @user_guesses.include?(letter) } == false
  end

def can_still_play
  @lives >= 1
end

end
