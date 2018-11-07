require 'word'

class Hangman
  def play_game
    word = Word.new('crazy')

    while word.is_not_guessed && word.can_still_play do
      guess = gets.chomp
      print word.add_guess(guess)
    end
  end
end

hangman = Hangman.new
hangman.play_game
