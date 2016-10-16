require 'rspec'

def solution s, p, q
  min_impacts = []
  impacts = s.chars.map do |e|
    case e
      when 'A' then
        1
      when 'C' then
        2
      when 'G' then
        3
      when 'T' then
        4
    end
  end
  p.each_index do |i|
    min_impacts << impacts[p[i]..q[i]].min
  end
  min_impacts
end

describe 'My behaviour' do
  it 'should do something' do
    expect(solution('CAGCCTA', [2, 5, 0], [4, 5, 6])).to eq [2, 4, 1]
  end
end
