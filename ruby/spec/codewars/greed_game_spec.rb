require 'rspec'

def score(dice)
  uniques = dice.uniq
  counts = {}
  uniques.each { |u| counts[u] = dice.count(u) }
  triple = counts.find { |k, v| v >= 3 } || [0]
  triple = triple[0]
  counts[triple] -= 3 if triple > 0
  score = triple * 100
  score *= 10 if triple == 1
  score += counts[5] * 50 if counts[5]
  score += counts[1] * 100 if counts[1]
  score
end

describe 'greed scoring' do

  it 'should value this triplet correctly' do
    expect(score([1, 1, 1, 1, 5])).to eq 1150;
  end
  it 'should value this triplet correctly' do
    expect(score([2, 2, 2, 3, 3])).to eq 200;
  end
  it 'should value accurately' do
    expect(score([2, 3, 4, 6, 2])).to eq 0;
  end
  it 'should value this as worthless' do
    expect(score([2, 3, 4, 6, 2])).to eq 0;
  end
  it 'should value this mixed set correctly' do
    expect(score([2, 4, 4, 5, 4])).to eq 450;
  end
end