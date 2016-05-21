require 'rspec'

MORSE_CODE = {
    ".-" => "A",
    "-..." => "B",
    "-.-." => "C",
    "-.." => "D",
    "." => "E",
    "..-." => "F",
    "--." => "G",
    "...." => "H",
    ".." => "I",
    ".---" => "J",
    "-.-" => "K",
    ".-.." => "L",
    "--" => "M",
    "-." => "N",
    "---" => "O",
    ".--." => "P",
    "--.-" => "Q",
    ".-." => "R",
    "..." => "S",
    "-" => "T",
    "..-" => "U",
    "...-" => "V",
    ".--" => "W",
    "-..-" => "X",
    "-.--" => "Y",
    "--.." => "Z",
}

def decode_morse(morse_code)
  morse_code_words = []
  word_codes = morse_code.strip.split('   ')
  word_codes.each do |word_code|
    word_string = word_code.split(' ').map{|code| MORSE_CODE[code]}
    morse_code_words << word_string.join
  end
  morse_code_words.join(' ')
end

describe '#decode_morse' do
  it 'should decode morse strings' do
    expect(decode_morse('.... . -.--   .--- ..- -.. .')).to eq('HEY JUDE')
  end
end
