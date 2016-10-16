class FrogJmp

  def self.solution x, y, d
    dist = y-x
    jumps = dist / d
    jumps += 1 if dist % d > 0
    jumps
  end
end