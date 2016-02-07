require 'rspec'

describe TapeEquilibrium do
  a = [3,1,2,4,3]
  b = []
  10000000.times do
    b << rand(1000)
  end

  describe '#solution' do
    it 'should return the lowest equilibrium' do
      expect(TapeEquilibrium.solution(a)).to eq 1
      # expect(TapeEquilibrium.solution(b)).to eq 1
    end
  end

  describe '#solution speedtest' do
    it 'should return the lowest equilibrium FAST' do
      expect(TapeEquilibrium.solution(b)).to eq 1
    end
  end
end