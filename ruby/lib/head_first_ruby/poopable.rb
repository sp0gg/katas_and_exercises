module Poopable
  def poop
    puts "Pooping..."
    scream
  end

  def [] num
    puts "nope. #{num}"
  end

  def []=(index, val)
    puts "You can't modify this, dude. #{index}, #{val}"
  end

end