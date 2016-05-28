require 'rspec'

PREFIX_EXPONENTS = %w(m km Mm Gm Tm Pm Em Zm Ym)

def meters(x)
  x = x.to_i
  log = Math.log10(x).floor/3
  triplet = 1000**log
  number = x / (triplet)
  secondary_number = (x - (number * 1000 ** log)) / (triplet / 1000) if log > 0
  string = number.to_s
  string << ".#{secondary_number}".chomp('0').chomp('0') if secondary_number && secondary_number > 0
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
