class NumPrinter
  def self.print_numbers
    (1..99).each do |num|
      puts "#{num} is odd" if num.odd?
    end
  end
end
NumPrinter.print_numbers
