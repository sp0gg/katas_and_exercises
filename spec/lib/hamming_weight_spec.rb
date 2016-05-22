require 'rspec'

def hamming_weight(x)
  weight = 0
  working_num = x

  until working_num == 0
    square = get_highest_square(working_num)
    working_num -= square
    weight += 1
  end
  weight
end

def get_highest_square(s)
  square = 1
  while square < s
    break if square * 2 > s
    square = square * 2
  end
  square
end

describe 'hamming weight calculator' do
  it 'should calculate hamming weight of integers' do
    expect(hamming_weight(0)).to eq 0
    expect(hamming_weight(1)).to eq 1
    expect(hamming_weight(2)).to eq 1
    expect(hamming_weight(21)).to eq 3
    expect(hamming_weight(10)).to eq 2
  end
end
