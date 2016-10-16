require_relative 'dog'

class AnimalRunner
  dog = Dog.new 'rover'
  dog.make_sound
  dog.scream
  dog.poop
  dog[:one]
  dog.yankhole
  dog[0] = :what
  puts "name is #{dog.name}"

  animal = Animal.new
  animal.make_sound
  animal.scream
  animal.poop
  animal['ASDASD']
  animal.corn
  puts "name default is #{animal.name}"

  puts "*****BLOX*****"
  dog.block_tester do |arg1|
    puts "#@#@##@#{arg1}"
  end
end
