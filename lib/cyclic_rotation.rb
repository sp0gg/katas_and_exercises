class CyclicRotation
  def self.solution a, k
    return [] if a.empty?
    k.times do
      e = a.pop
      a.unshift(e)
    end
    a
  end
end