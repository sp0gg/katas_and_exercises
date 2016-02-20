require 'rspec'

def solution a, b, k
  count = 0
  count += 1 if a % k == 0
  left = a / k
  right = b / k
  count += right - left
end

describe 'My behaviour' do

  it 'should do something' do
    expect(solution 17, 17, 17).to eq 1
  end
  it 'should do something' do
    expect(solution 6, 11, 5).to eq 1
  end
  it 'should do something' do
    expect(solution 4, 10, 2).to eq 4
  end
  it 'should do something' do
    expect(solution 5, 11, 2).to eq 3
  end
  it 'should do something' do
    expect(solution 6, 11, 2).to eq 3
  end
  it 'should do something' do
    expect(solution 6, 11, 3).to eq 2
  end
  it 'should do something' do
    expect(solution 3, 4, 2).to eq 1
  end
  it 'should do something' do
    expect(solution 6, 11, 5).to eq 1
  end
  it 'should do something' do
    expect(solution 2, 2, 1).to eq 1
  end
  it 'should do something' do
    expect(solution 6, 6, 17).to eq 0
  end
  it 'should do something' do
    expect(solution 11, 16, 17).to eq 0
  end
  it 'should do something' do
    expect(solution 19, 345, 17).to eq 19
  end
  it 'should do something' do
    expect(solution 11, 345, 17).to eq 20
  end

end
