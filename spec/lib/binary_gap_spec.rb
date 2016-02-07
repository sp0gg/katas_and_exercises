require 'rspec'

def solution n
  calc_gap n.to_s(2)
end

def calc_gap binary_string
  stripped_binary_string = binary_string.slice(/1(.*)1/)
  return 0 if stripped_binary_string.nil?
  gaps = stripped_binary_string.split('1')
  return 0 if gaps.empty?
  gaps.sort.last.size
end

def solution_ryan(n)
  n = n.to_s(2)
  split_array = n.split('1')
  split_array.pop if n.end_with?(split_array[-1] || 'X')
  split_array.map(&:length).max || 0
end

describe 'BinaryGap' do
  describe '#solution' do
    it 'should return the largest binary gap' do
      expect(solution(9)).to eq 2
      expect(solution(529)).to eq 4
      expect(solution(20)).to eq 1
      expect(solution(15)).to eq 0
      expect(solution(1041)).to eq 5
    end
  end

  describe '#calc_gap' do
    it 'should calculate the largest gap of a binary string' do
      expect(calc_gap '11111111').to eq 0
      expect(calc_gap '11011111').to eq 1
      expect(calc_gap '11011001').to eq 2
      expect(calc_gap '10011001').to eq 2
      expect(calc_gap '00011001').to eq 2
      expect(calc_gap '00000001').to eq 0
      expect(calc_gap '1000010001').to eq 4
      expect(calc_gap '10000010001').to eq 5
    end
  end
  describe '#solution_ryan' do
    it 'should calculate the largest gap of a binary string' do
      expect(solution_ryan(1041)).to eq 5
    end
  end
end