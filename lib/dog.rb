require_relative 'animal'

class Dog < Animal


  def make_sound
    super
    puts 'Woof woof man.', 'Scratches self.'
  end

end