class TapeEquilibrium

  def self.solution a

    #add all together.
    sum = a.reduce :+
    puts "sum #{sum}"
    left = a[0]
    right = sum - left
    puts "l #{left} r #{right}"
    min_diff = (right-left).abs
    puts "mindiff #{min_diff}"

    #run p through entire array.
    1.upto(a.size-2) do |i|

      left += a[i]
      right -= a[i]
      diff = (right-left).abs
      min_diff = diff if min_diff > diff
    end
    p min_diff
  end

end