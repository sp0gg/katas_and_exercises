require_relative 'poopable'
class Animal

  include Poopable
  attr_reader :name

  def initialize name = 'Sparky'
    @name = name
  end

  def make_sound
    puts "default sound"
  end

  def scream
    puts "AAAAUUUUGGGGGHHHHHH"
  end

  def method_missing method
    puts "you just grabbed my #{method}"
  end

  def block_tester
    puts "in method."
    # yield('lkjlkjlkjlkj')
  end
end

