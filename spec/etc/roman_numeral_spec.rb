class RomanNumeralSpec
  require 'roman_numeral_calculator_part_deux'

  describe RomanNumeralCalculatorPartDeux do
    subject(:calc) { RomanNumeralCalculatorPartDeux }
    specify { expect(calc.calculate(1)).to eq 'I' }
    specify { expect(calc.calculate(2)).to eq 'II' }
    specify { expect(calc.calculate(3)).to eq 'III' }
    specify { expect(calc.calculate(4)).to eq 'IV' }
    specify { expect(calc.calculate(5)).to eq 'V' }
    specify { expect(calc.calculate(14)).to eq 'XIV' }
    specify { expect(calc.calculate(17)).to eq 'XVII' }
    specify { expect(calc.calculate(28)).to eq 'XXVIII' }
    specify { expect(calc.calculate(50)).to eq 'L' }
    specify { expect(calc.calculate(44)).to eq 'XLIV' }
    specify { expect(calc.calculate(68)).to eq 'LXVIII' }
    specify { expect(calc.calculate(99)).to eq 'XCIX' }
    specify { expect(calc.calculate(100)).to eq 'C' }
    specify { expect(calc.calculate(124)).to eq 'CXXIV' }
    specify { expect(calc.calculate(137)).to eq 'CXXXVII' }
    specify { expect(calc.calculate(150)).to eq 'CL' }
    specify { expect(calc.calculate(155)).to eq 'CLV' }
    specify { expect(calc.calculate(169)).to eq 'CLXIX' }
    specify { expect(calc.calculate(255)).to eq 'CCLV' }
    specify { expect(calc.calculate(321)).to eq 'CCCXXI' }
    specify { expect(calc.calculate(346)).to eq 'CCCXLVI' }
    specify { expect(calc.calculate(457)).to eq 'CDLVII' }
    specify { expect(calc.calculate(620)).to eq 'DCXX' }
    specify { expect(calc.calculate(819)).to eq 'DCCCXIX' }
    specify { expect(calc.calculate(938)).to eq 'CMXXXVIII' }
    specify { expect(calc.calculate(969)).to eq 'CMLXIX' }
    specify { expect(calc.calculate(1000)).to eq 'M' }
    specify { expect(calc.calculate(1089)).to eq 'MLXXXIX' }
    specify { expect(calc.calculate(1148)).to eq 'MCXLVIII' }
    specify { expect(calc.calculate(1242)).to eq 'MCCXLII' }
    specify { expect(calc.calculate(1695)).to eq 'MDCXCV' }
    specify { expect(calc.calculate(1894)).to eq 'MDCCCXCIV' }
    specify { expect(calc.calculate(2000)).to eq 'MM' }
    specify { expect(calc.calculate(2488)).to eq 'MMCDLXXXVIII' }
    specify { expect(calc.calculate(2500)).to eq 'MMD' }
    specify { expect(calc.calculate(2580)).to eq 'MMDLXXX' }
    specify { expect(calc.calculate(2708)).to eq 'MMDCCVIII' }
    specify { expect(calc.calculate(2963)).to eq 'MMCMLXIII' }
  end
end