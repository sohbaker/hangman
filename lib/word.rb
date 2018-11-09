require 'clean_words'

class Word

  def initialize(word_gen)
    word_gen = CleanWords::Random.new
    @word = word_gen.fetch
    @word_as_array = @word.split('')
    @user_guesses = []
    @not_in_word = []
    @lives = 5

    hint = @word.size
    print "\u{1F914} The word is #{"_ " * hint}\nMake a guess\n> "
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

    if @correct_guesses == @word_as_array
      return "\nYou have WON!\u{1F389}\u{1F3C6}\nThe answer is #{@word}!\n"
    end

    return "Hint: #{correct_guesses.join(' ')}\nThese letters are incorrect: #{@not_in_word.join(', ')}\nMake another guess\n> "
  end

  def wrong_guesses()
    if @not_in_word.count >= 1 && @lives > 1
      @lives = @lives - 1
      return "\nWrong answer! \nThese letters are incorrect: #{@not_in_word.join(',')}.\nYou lose one life! \u{1F614} |Lives left: #{@lives}|\nMake another guess\n> "
    end

    if @not_in_word.count >= 1 && @lives == 1
      @lives = @lives - 1
      no_lives_left()
    end
  end

  def no_lives_left
    print "YOU LOSE! \u{26B0}\nThe word was #{@word}.\nWould you like to play again? ('Yes' or 'No')\n> "
    play_again = gets.chomp

    if play_again == "Yes"
      initialize('')
    else
      exit(0)
    end
  end

  def is_not_guessed
    @word_as_array.all? { |letter| @user_guesses.include?(letter) } == false
  end

  def can_still_play
    @lives >= 1
  end
end
