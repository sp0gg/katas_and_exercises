require 'rspec'

def reverse_string s
  start_index = s.length-1
  start_index.downto 1 do |i|
    s.insert(start_index-i, s[-1])
    s.chop!
  end
  s
end

describe 'String reverser' do
  it 'should reverse a string' do
    expect(reverse_string 'abcdefg123').to eq '321gfedcba'
    expect(reverse_string 'a').to eq 'a'
    expect(reverse_string '').to eq ''
    expect(reverse_string '1,2,3,4').to eq '4,3,2,1'
  end
end
