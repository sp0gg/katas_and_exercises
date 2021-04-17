require 'rspec'

def solution x, a
  counter = x
  required_values = []
  1.upto(x) { required_values << false }

  a.each_with_index do |v, i|
    unless required_values[v-1]
      required_values[v-1] = true
      counter -= 1
    end
    return i if counter == 0
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
