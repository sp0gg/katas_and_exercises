class OddsInArray

  def self.solution a
    a.sort!

    i = 0
    while i < a.size
      if a[i] == a[i+1]
        i += 1
      else
        return a[i]
      end
      i += 1
    end

  end
end