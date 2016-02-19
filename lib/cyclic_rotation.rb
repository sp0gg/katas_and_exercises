class CyclicRotation
  def self.solution a, k
    return [] if a.empty?
    k = k % a.size
    a.rotate! -k
  end
end
