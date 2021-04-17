require 'rspec'

def solution n, a
  counters = []
  max_counter_value = 0
  subsets = get_subsets n, a

  subsets.each do |subset|
    if !subset.empty? && subset[-1] > n
      subset.delete_at(-1)
      max_counter_value += subset.uniq.map { |e| subset.count(e) }.max || 0
    else
      n.times { counters << max_counter_value }
      subset.each do |e|
        counters[e-1] += 1
      end
    end
  end
  counters
end

def get_subsets n, a
  subsets = []
  until a.empty? do
    current_reset_index = a.index { |e| e > n } || a[-1]
    subset = a.slice!(0..current_reset_index)
    subsets << subset
    subsets << [] if a.empty? && subset[-1] > n
  end
  subsets
end

describe 'Get subsets to add' do
  it 'should return subsets of arrays' do
    expect(get_subsets(5, [3, 4, 4, 6, 6, 6, 1, 4, 4])).to eq [[3, 4, 4, 6], [6], [6], [1, 4, 4]]
    expect(get_subsets(5, [3, 4, 4, 6, 1, 4, 4, 85])).to eq [[3, 4, 4, 6], [1, 4, 4, 85], []]
    expect(get_subsets(5, [6])).to eq [[6], []]
    expect(get_subsets(5, [1])).to eq [[1]]
  end
end

describe 'My behaviour' do
  it 'should do something' do
    expect(solution(5, [3, 4, 4, 6, 1, 4, 4])).to eq [3, 2, 2, 4, 2]
    expect(solution(5, [3, 4, 4, 6, 6, 6, 1, 4, 4])).to eq [3, 2, 2, 4, 2]
    expect(solution(5, [3, 4, 4, 6, 1, 4, 4, 85])).to eq [4, 4, 4, 4, 4]
    expect(solution(1, [1])).to eq [1]
    expect(solution(1, [6])).to eq [0]
  end
end

def solution_one n, a
  counters = []
  n.times { counters << 0 }
  a.each do |e|
    if e <= n
      counters[e-1] += 1
    else
      max_counter = counters.max
      counters = []
      n.times { counters << max_counter }
    end
  end
  counters
end
