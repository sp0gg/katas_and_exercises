require 'rspec'

def solution a
  result = 0
  total = a.inject :+
  a.each do |e|
    if e == 0
      result += total
      return -1 if result > 1_000_000_000
    else
      total -= 1
      end
  end
  result
end

describe 'My behaviour' do
  it 'should do something' do
    expect(solution([0, 1, 0, 1, 1])).to eq 5
  end
end
