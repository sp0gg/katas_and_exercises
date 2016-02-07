require 'rspec'

test_name = 'YOJIMBO!'

describe Game do
  # let(:test_name) { 'YOJIMBO!' }
  game = Game.new({:name => test_name})
  game.number = 3

  describe '#initialize' do
    context 'when game is started' do
      it 'stores the user\'s name' do
        expect(game.name).to eq test_name
      end

      it 'generates and stores a random number between 1-100' do
        expect(1..5).to include game.number
        puts "game number is #{game.number}"
      end

    end
  end

  describe '#guess_number' do
    context 'when a number is guessed correctly' do
      it 'responds with true' do
        expect(game.guess_number(3)[:correct]).to be true
      end
    end
    context 'when a number is guessed incorrectly' do
      it 'responds with false' do
        expect(game.guess_number(1)[:correct]).to be false
      end

      context 'and the guess is higher than target' do
        it 'responds with \'high\'' do
          expect(game.guess_number(5)[:hi_low]).to be :high
        end
        context 'and the guess is lower than target' do
          it 'responds with \'low\'' do
            expect(game.guess_number(1)[:hi_low]).to be :low
          end
        end
      end
    end
    context 'when a number is guessed' do
      game2 = Game.new({:name => test_name})
      game2.number = 5
      5.times { game2.guess_number(1) }
      it 'records the number of guesses' do
        expect(game2.number_of_guesses).to be 5
      end
    end

  end
end