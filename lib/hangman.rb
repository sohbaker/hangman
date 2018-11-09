require 'word'

class Hangman
  def greet_user
    print "Welcome to Hangman!\n"
    print "Instructions: You will be given a random word to guess.\nTo win, you need to enter a letter which you think might be in the word, until you have completed the word.\nBUT, you only 5 lives!\nIf you lose all your lives before guessing the word, you can choose to: \n \u2022 play again guessing the same word, \n \u2022 play again guessing a different word, or \n \u2022 leave the game.\nIf you'd like to start type 'ready'; or type 'leave' to exit game\n> "
    start = gets.chomp

    if start == "ready"
      play_game()
    elsif start == "leave"
      exit(0)
    end
  end

  def play_game
    word = Word.new('')

    while word.is_not_guessed && word.can_still_play do
      guess = gets.chomp
      print word.add_guess(guess)
    end
  end
end

hangman = Hangman.new
hangman.greet_user
