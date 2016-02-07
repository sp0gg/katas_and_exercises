require 'rspec'

describe CyclicRotation do

  describe '#solution' do
    it 'should rotate arrays' do
      expect(CyclicRotation.solution([3, 8, 9, 7, 6], 1)).to eq [6, 3, 8, 9, 7]
      expect(CyclicRotation.solution([3, 8, 9, 7, 6], 3)).to eq [9, 7, 6, 3, 8]
      expect(CyclicRotation.solution([], 1)).to eq []
    end
  end
end