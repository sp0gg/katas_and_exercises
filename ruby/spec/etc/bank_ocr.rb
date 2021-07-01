# frozen_string_literal: true

class BankOCRProcessorManager
  def self.process_batch(input)
    input.lines.each_slice(3).with_object([]) do |account_number, output|
      output << format_account(process(account_number))
    end.join("\n") + "\n"
  end

  def self.process(account_number)
    BankOCRProcessor.new(account_number.join).process
  end

  def self.format_account(account)
    account_number = account[:account_number]
    return "#{account_number} ILL" unless account[:legible]

    account[:valid] ? account_number : "#{account_number} ERR"
  end
end

class BankOCRProcessor
  DIGIT_GRID__NUMBER = [ZERO = " _ \n| |\n|_|",
                        ONE = "   \n  |\n  |",
                        TWO = " _ \n _|\n|_ ",
                        THREE = " _ \n _|\n _|",
                        FOUR = "   \n|_|\n  |",
                        FIVE = " _ \n|_ \n _|",
                        SIX = " _ \n|_ \n|_|",
                        SEVEN = " _ \n  |\n  |",
                        EIGHT = " _ \n|_|\n|_|",
                        NINE = " _ \n|_|\n _|"].zip((0..9)).to_h.freeze

  def initialize(input)
    @input = input
    @legible = true
  end

  def process
    { account_number: account_numbers.join, legible: legible?, valid: valid_checksum? }
  end

  private

  attr_reader :input

  def account_numbers
    end_idx = digit_grids[0].length - 1
    @account_numbers ||= 0.upto(end_idx).each_with_object([]) do |idx, numbers|
      numbers << lookup_number(assemble_digit(idx))
    end
  end

  def assemble_digit(idx)
    select_digit_grid(idx).map(&:join).join("\n")
  end

  def select_digit_grid(x_index)
    0.upto(2).each_with_object([]) do |y_index, digit_grid|
      digit_grid << digit_grids[y_index][x_index]
    end
  end

  def digit_grids
    @digit_grids ||= input.lines.each_with_object([]) do |line, grid_line|
      grid_line << line.chomp.chars.each_slice(3).to_a
    end
  end

  def lookup_number(digit_grid)
    number = DIGIT_GRID__NUMBER[digit_grid]

    @legible = false unless number
    number || '?'
  end

  def legible?
    @legible
  end

  def valid_checksum?
    return false unless legible? && account_numbers.length == 9

    (account_numbers.reverse.inject do |num, idx|
      num * (idx + 1)
    end % 11).zero?
  end
end
