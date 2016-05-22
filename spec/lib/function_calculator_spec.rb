require 'rspec'
require 'function_calculator'

describe 'function calculator' do
  it 'should calculate by passing in function names' do
    expect(seven(times(five()))).to eq 35
    expect(seven).to eq 7
    expect(five(times(seven()))).to eq 35
    expect(four(plus(nine()))).to eq 13
    expect(eight(minus(three()))).to eq 5
    expect(six(divided_by(two()))).to eq 3
  end
end
