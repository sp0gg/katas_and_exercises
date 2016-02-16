require 'rspec'

def solution a
  a = a.delete_if { |e| e <= 0 }.uniq.sort
  return 1 if a.empty? || a[0] != 1

  0.upto (a.size-2) do |i|
    return (a[i]+1) if (a[i+1] - a[i] > 1)
  end

  a[-1]+1
end

describe 'smallest missing positive integer' do
  it 'should return the smallest missing integer' do
    expect(solution [1, 3, 6, 4, 1, 2]).to eq 5
    expect(solution [-100, -10001, 0, 3, 5, 6, 4, 1, 2]).to eq 7
    expect(solution [14, 16, 1, 3, 6, 4, 1, 2, 5, 7, 8, 9, 10, 12, 13, -88]).to eq 11
    expect(solution [-1, 1, 1, 1, 1, 1, 11, 1, 1, 1]).to eq 2
    expect(solution [1]).to eq 2
    expect(solution [0]).to eq 1
    expect(solution [-200]).to eq 1
    expect(solution [2, 3, 4, 5]).to eq 1
  end
end
