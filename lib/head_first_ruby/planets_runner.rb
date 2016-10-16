class CelestialBody
  attr_accessor :type, :name

  def self.planet
    body = CelestialBody.new
    body.type = 'Planet'
    body
  end

  def self.moon
    body = CelestialBody.new
    body.type = 'Moon'
    body
  end
end

bodies = Hash.new do |hash, key|
  p "BLOXXX #{hash}, #{key}"
  body = CelestialBody.planet
  p body
  hash[key] = body
end

bodies[:mars].name = 'Mars'
bodies[:europa].type = 'Moon'
bodies[:europa].name = 'Europa'
bodies[:triton].name = 'Triton'
bodies[:triton].type = 'Moon'

p bodies