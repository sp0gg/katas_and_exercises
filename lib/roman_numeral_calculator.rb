class RomanNumeralCalculator

  ONES = {1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX'}
  TENS = {1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 5 => 'L', 6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC'}
  HUNDREDS = {1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 5 => 'D', 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM'}
  THOUSANDS = {1 => 'M', 2 => 'MM', 3 => 'MMM'}
  DECIMAL_PLACES = {1 => ONES, 2 => TENS, 3 => HUNDREDS, 4 => THOUSANDS}

  def self.calculate integer_input
    numeral = ''
    integer_string = integer_input.to_s
    decimal_places = integer_string.size

    (1..decimal_places).reverse_each do |decimal_place|
      digit = integer_string.slice!(0).to_i
      numeral << calculate_numeral_place(digit, decimal_place) unless numeral && digit == 0
    end

    numeral
  end

  def self.calculate_numeral_place digit, decimal_place
    if digit == 0
     numeral_place = DECIMAL_PLACES[decimal_place+1][1]
    else
      numeral_place = DECIMAL_PLACES[decimal_place][digit]
    end
    numeral_place
  end
end