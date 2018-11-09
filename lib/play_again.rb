require 'word'

class RepeatSameWord
  # def initialize(word_instance)
  #   @instance_of_Word = word_instance
  # end

  # def setWord=(store_word)
  #   @word = store_word.to_s
  # end

  def repeat_calls_add_guess
    @instance_of_Word.add_guess
  end

  def play_again
    @user_guesses = []
    print "You lost all your lives! Enter a new guess to play again\n> "
    # if @lives == 0
      # @word = store_word.join('')
      # @word_as_array = store_word
      @lives = @lives + 5
    #   return "You lost all your lives! Enter a new guess to play again"
    # end
    add_guess(guess)
    p @word
  end

end

repeat = RepeatSameWord.new
repeat.play_again
