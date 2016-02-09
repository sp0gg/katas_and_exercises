require 'rspec'

def fibonacci n
  fibs = []
  n.times do
    if fibs.empty?
      fibs << 0
    elsif fibs.size < 2
      fibs << (fibs.last + 1)
    else
      fibs << (fibs.last + fibs[-2])
    end
  end
  fibs.last
end

describe 'fibonacci' do

  it 'should return N fibonacci numbers' do
    expect(fibonacci 1).to eq 0
    expect(fibonacci 2).to eq 1
    expect(fibonacci 3).to eq 1
    expect(fibonacci 4).to eq 2
    expect(fibonacci 5).to eq 3
    expect(fibonacci 6).to eq 5
    expect(fibonacci 7).to eq 8
    expect(fibonacci 14).to eq 233

  end
end