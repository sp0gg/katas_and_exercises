require 'rspec'
require 'bowling_game'

describe BowlingGame do

  let(:game) { BowlingGame.new }

  context '#score' do
    it 'should return 0 for all zeroes rolled' do
      20.times { game.roll(0) }
      expect(game.score).to eq 0
    end

    it 'should return 20 for all ones rolled' do
      20.times { game.roll(1) }
      expect(game.score).to eq 20
    end

    it 'should correctly calculate spares' do
      2.times { game.roll(5) }
      18.times { game.roll(1) }
      expect(game.score).to eq 29
    end

    it 'should correctly calculate strikes' do
      1.times { game.roll(10) }
      18.times { game.roll(1) }
      expect(game.score).to eq 30
    end

    it 'should correctly calculate spares with an ending spare' do
      2.times { game.roll(5) }
      17.times { game.roll(1) }
      game.roll(9)
      game.roll(4)
      expect(game.score).to eq 41
    end

    it 'should correctly calculate strikes with an ending strike' do
      18.times { game.roll(1) }
      game.roll(10)
      game.roll(4)
      game.roll(2)
      expect(game.score).to eq 34
    end
    it 'should correctly calculate strikes with two ending strikes' do
      18.times { game.roll(1) }
      game.roll(10)
      game.roll(10)
      game.roll(7)
      expect(game.score).to eq 45
    end
    it 'should correctly calculate a perfect game' do
      12.times {game.roll(10)}
      expect(game.score).to eq 300
    end
  end
end

describe BowlingGame::Frame do

  let (:frame) { BowlingGame::Frame.new }

  context '#pins_dropped' do
    it 'should store the number of pins dropped in the frame for each roll' do
      frame.drop_pins(4)
      frame.drop_pins(5)
      expect(frame.pins_dropped).to eq [4, 5]
    end
  end

  context '#value' do
    it 'should return the point value of a frame' do
      frame.drop_pins(4)
      frame.drop_pins(5)
      expect(frame.value).to eq 9
    end
  end

  context '#outcome' do
    it 'should return the scoring outcome of a completed open frame' do
      frame.drop_pins(3)
      frame.drop_pins(5)
      expect(frame.outcome).to eq :open
    end
    it 'should return the scoring outcome of a spare' do
      frame.drop_pins(3)
      frame.drop_pins(7)
      expect(frame.outcome).to eq :spare
    end
    it 'should return the scoring outcome of a strike' do
      frame.drop_pins(10)
      expect(frame.outcome).to eq :strike
    end
  end

  context 'complete?' do
    it 'should be complete if there have been two rolls' do
      frame.drop_pins(4)
      frame.drop_pins(6)
      expect(frame).to be_complete
    end
    it 'should be complete if the first roll dropped 10 pins' do
      frame.drop_pins(10)
      expect(frame).to be_complete
    end
    it 'should not be complete if there is only one roll and the roll dropped less than 10 pins' do
      frame.drop_pins(1)
      expect(frame).not_to be_complete
    end
    it 'should not be complete if there have been no pins dropped' do
      expect(frame).not_to be_complete
    end
  end
end
