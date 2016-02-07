require_relative 'game'

class GameRunner
  puts "Welcome to game, mortal.", "Give me your name."
  name = gets.chomp
  game = Game.new({:name => name})
  puts "You must now guess my number. It is between 1 and 100."

  until game.number_of_guesses == 10
    guess = gets.chomp.to_i
    number_guess_response = game.guess_number(guess)

    if number_guess_response[:correct]
      puts "Your life continues... for now."
      break
    elsif game.number_of_guesses == 10
      puts "You are DONE. Let the number #{game.number} haunt you for eternity!"
      break
    else
      puts case number_guess_response[:hi_low]
             when :high
               "Your number was too high."
             when :low
               "Your number was too low."
             else
               raise "Oh crap, something is wrong."
           end
      puts "You have #{10 - game.number_of_guesses} guesses remaining before I destroy you."
    end
  end

end