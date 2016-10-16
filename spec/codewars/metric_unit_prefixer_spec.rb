require 'rspec'

PREFIX_EXPONENTS = %w(m km Mm Gm Tm Pm Em Zm Ym)

def meters(x)
  x = x.to_i
  log = Math.log10(x).floor/3
  first_triplet = 1000**log
  second_triplet = first_triplet / 1000
  first_triplet_value = x / (first_triplet)
  second_triplet_value = (x - (first_triplet_value * 1000 ** log)) / second_triplet if log > 0

  string = first_triplet_value.to_s
  string << ".#{second_triplet_value}".chomp('00') if second_triplet_value && second_triplet_value > 0
  string << PREFIX_EXPONENTS[log]
end

describe 'metric unit prefixer' do
  it 'should prefix metric units' do
    expect(meters(123456)).to eq '123.456km'
    expect(meters(9000000000.0)).to eq '9Gm'
    expect(meters(12300000)).to eq '12.3Mm'
    expect(meters(1000)).to eq '1km'
    expect(meters(1)).to eq '1m'
  end
end
