require 'rspec'

def solution a
  largest_gap = 0
  a.sort!

  0.upto(a.size-2) do |i|
    gap = (a[i+1] - a[i]).abs
    largest_gap = gap if gap > largest_gap
  end
  (largest_gap / 2).floor
end

test_array = [10, 0, 8, 2, -1, 12, 11, 3]
test_array_2 = [5, 5]
test_array_3 = [-10, -5,4,10,100]

describe 'bike test' do
  describe '#solution' do
    it 'should find the largest gap in the sequence' do
      expect(solution test_array).to eq 2
      expect(solution test_array_2).to eq 0
      expect(solution test_array_3).to eq 45
    end
  end
end