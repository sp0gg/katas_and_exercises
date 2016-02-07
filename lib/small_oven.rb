class OvenEmptyException < StandardError
end
class OvenOffException < StandardError
end

class SmallOven

  attr_accessor :contents, :state

  def turn_on
    puts "Turning oven on."
    @state = "on"
  end

  def turn_off
    puts "Turning oven off."
    @state = "off"
  end

  def bake
    unless @state == "on"
      raise OvenOffException, "You need to turn the oven on first!"
    end
    if @contents == nil
      raise OvenEmptyException, "There's nothing in the oven!"
    end
    "golden-brown #{contents}"
  end
end

dinner = ['turkey', nil, 'pie']
oven = SmallOven.new
oven.turn_off
dinner.each do |item|
  oven.contents = item
  begin
    puts "Serving #{oven.bake}."
  rescue OvenOffException =>  error
    puts "Oven was off when baking attempted. Turning oven on and retrying."
    oven.turn_on
    retry
  rescue => e
    puts "There was a problem: #{e.message}"
  ensure
    puts "Let's not burn our house down, k?"
    oven.turn_off
  end

end

puts "You left the oven on and your house burned down. Oops." unless oven.state == 'off'