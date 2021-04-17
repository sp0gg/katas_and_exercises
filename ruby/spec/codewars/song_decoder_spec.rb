require 'rspec'

def song_decoder(song)
  p song.split('WUB').join(' ').strip.squeeze
end

describe 'song decoder' do
  it 'should decode songs' do
    expect(song_decoder('AWUBBWUBC')).to eq 'A B C'
    expect(song_decoder('AWUBWUBWUBBWUBWUBWUBC')).to eq 'A B C'
    expect(song_decoder('WUBAWUBBWUBCWUB')).to eq 'A B C'
  end
end
