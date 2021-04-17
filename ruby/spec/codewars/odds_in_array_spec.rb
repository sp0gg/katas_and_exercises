require 'rspec'

describe OddsInArray do
  describe '#solution' do
    it 'should return the value of the unpaired element' do
    expect(OddsInArray.solution([9,3,9,3,9,7,9])).to eq 7
    end
  end

end