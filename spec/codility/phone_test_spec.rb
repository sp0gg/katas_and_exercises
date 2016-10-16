require 'rspec'

#first draft
def solution s
  numbers_only = s.gsub('-', '').gsub(' ', '')
  new_string_elements = []
  until numbers_only == ''
    if numbers_only.size == 5
      new_string_elements << numbers_only.slice!(0, 3)
      new_string_elements << numbers_only.slice!(0, 2)
    elsif numbers_only.size == 4
      2.times do
        new_string_elements << numbers_only.slice!(0, 2)
      end
    else
      new_string_elements << numbers_only.slice!(0, 3)
    end
  end
  new_string_elements.join('-')
end

describe 'phone test' do
  describe '#solution' do
    it 'should format string' do
      expect(solution '2654').to eq '26-54'
      expect(solution '654').to eq '654'
      expect(solution '26541').to eq '265-41'
      expect(solution '00-44 48 5555 8361').to eq '004-448-555-583-61'
      expect(solution '54').to eq '54'
      expect(solution '0 - 22 1985--324').to eq '022-198-53-24'
      expect(solution '555372654').to eq '555-372-654'
      expect(solution '5553726541').to eq '555-372-65-41'
      expect(solution '55537265412').to eq '555-372-654-12'
    end
  end
end