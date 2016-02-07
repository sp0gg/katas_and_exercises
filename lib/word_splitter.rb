class WordSplitter
  include Enumerable
  attr_accessor :string

  def initialize sentence
    self.string = sentence
  end

  def each
    string.split(" ").each do |word|
      yield word
    end
  end
end

ws = WordSplitter.new(" this is an example of a sentence that can be split.")
p ws.find_all {|word| (2..4).include?(word.length)}.sort
p ws.find_all {|word| word.start_with?('s')}
p ws.partition {|word| word.length > 1}.join