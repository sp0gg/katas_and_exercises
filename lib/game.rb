class Game

  attr_reader :name
  attr_accessor :number
  attr_reader :number_of_guesses

  def initialize(args={})
    @number = rand(100) + 1
    @name = args[:name]
    @number_of_guesses = 0
    greet @name
  end

  def greet name
    puts "Welcome to game, #{name}.", "You are mine now."
  end

  def guess_number number
    @number_of_guesses += 1
    if number > @number
      response = {:correct => false, :hi_low => :high}
    elsif number < @number
      response = {:correct => false, :hi_low => :low}
    elsif number == @number
      response = {:correct => true}
    else
      raise "Houston, we have a problem."
    end
    response
  end

end