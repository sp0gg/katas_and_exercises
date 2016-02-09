require 'rspec'

def solution_one x, a
  required_values = []
  1.upto(x) { |i| required_values << i }
  found_values = []
  a.each_index do |i|
    found_values << a[i] unless found_values.include?(a[i])
    return i if required_values == found_values.sort!
  end
  -1
end

def solution x, a
  uniques = []
  a.each_index do |i|
    uniques << a[i] unless uniques.include?(a[i])
    return i if uniques.inject(:*) == (1..x).inject(:*)
  end
  -1
end

describe 'FrogRiverOne' do
  describe '#solution' do
    it 'should do something' do

      expect(solution(5, [1, 3, 1, 4, 2, 3, 5, 4])).to eq 6
      expect(solution(1, [1])).to eq 0
      expect(solution(5, [1])).to eq -1
      expect(solution(2, [1, 2])).to eq 1
      expect(solution(5, [2])).to eq -1
      expect(solution(5, [1, 3, 1, 4, 2, 3, 3, 4])).to eq -1

    end
  end
end