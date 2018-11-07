class Word
  def initialize(word)
    @word = word
    # @word_split = word.split('')
    @user_guesses = []
    @lives = 5
    # @guesses_count = 0

  end

  def add_guess(letter)
    @user_guesses.push(letter)
    # @guesses_count = +1

    # if @word_split.include?(letter) == false
    #   p @word_split
    #   @lost_lives << 'x'
    #   p @lost_lives
    # end
  end

  def guessed_letters
    # ['_', '_', '_', '_', '_']
    # wrong_letters = []

    reveal_correct_letters = []

      @word.split('').each do |letter|
        if @user_guesses.include?(letter)
          reveal_correct_letters.push(letter)

          # reveal_correct_letters -= @user_guesses - can't use this because it reduces the number of arguments expected
        else
          reveal_correct_letters.push('_')
          # @lost_lives << 'x'
          # wrong_letters.push()
          # print "#{@user_guesses} Wrong letter. Guess again"
          # p wrong_letters
        end
      end

      if reveal_correct_letters == @word.split('')
        puts "You have WON!"
        puts "The answer is #{@word}!"
      end

      if @lives == 0
        puts 'YOU LOSE!'
        puts "The answer was #{@word}!"
      end

    p reveal_correct_letters
    reveal_correct_letters

  end
  #   @word.split('').map do |letter|
  #     '_'
  # end
end
