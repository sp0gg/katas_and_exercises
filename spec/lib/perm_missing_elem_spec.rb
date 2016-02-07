require 'rspec'

def solution a
  a.sort!
  return 1 if a[0] != 1
  0.upto a.size do |i|
    return a[i]+1 if a[i+1] != (a[i] + 1)
  end
  a.size
end

max = 1000000
range = (1..max)
a = []
(range).each { |i| a << i }
random = rand(max)
a.delete(random)
last_missing = [1,2,3,4,5]
first_missing = [2,3,4,5]

describe 'PermMissingElem' do
  describe '#solution' do
    it 'should do something' do
      expect(solution([2, 3, 1, 5])).to eq 4
      expect(solution(a)).to eq random
      expect(solution(last_missing)).to eq 6
      expect(solution(first_missing)).to eq 1
      expect(solution([])).to eq 1
      expect(solution([1,3])).to eq 2
    end
  end
end