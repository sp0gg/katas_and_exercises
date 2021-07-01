# frozen_string_literal: true

require 'rspec'
require_relative 'bank_ocr'

describe BankOCRProcessorManager do
  describe '.process' do
    context 'with multiple full lines and varying statuses' do
      subject(:manager) { BankOCRProcessorManager.process_batch(input) }

      let(:input) do
        <<~STR
              _  _  _  _  _  _  _  _ 
          |_||_   ||_ | ||_|| || || |
            | _|  | _||_||_||_||_||_|
           _  _     _  _        _  _ 
          |_ |_ |_| _|  |  ||_||_||_ 
          |_||_|  | _|  |  |  | _| _|
           _  _     _  _        _  _ 
          |_ |_ |X| _|  |  ||_||X||_ 
          |_||_|  | _|  |  |  | _| _|
        STR
      end
      let(:output) do
        <<~STR
          457508000
          664371495 ERR
          66?3714?5 ILL
        STR
      end

      it 'displays results for multiple account numbers' do
        expect(manager).to eq output
      end
    end
  end
end

shared_examples 'a bank ocr processor' do
  subject(:processor) { BankOCRProcessor.new(input).process }

  it { is_expected.to eq output }
end

describe BankOCRProcessor do
  context 'with full line' do
    context 'when legible and valid checksum' do
      it_behaves_like 'a bank ocr processor' do
        let(:input) do
          # TODO: omg auto format was messing me up
          <<~STR
                _  _  _  _  _  _  _  _ 
            |_||_   ||_ | ||_|| || || |
              | _|  | _||_||_||_||_||_|
          STR
        end
        let(:output) { { account_number: '457508000', legible: true, valid: true } }
      end
    end

    context 'when legible and invalid checksum' do
      it_behaves_like 'a bank ocr processor' do
        let(:input) do
          <<~STR
             _  _     _  _        _  _ 
            |_ |_ |_| _|  |  ||_||_||_ 
            |_||_|  | _|  |  |  | _| _|
          STR
        end
        let(:output) { { account_number: '664371495', legible: true, valid: false } }
      end
    end

    context 'when illegible' do
      it_behaves_like 'a bank ocr processor' do
        let(:input) do
          <<~STR
             _  _     _  _        _  _ 
            |_ |_ |X| _|  |  ||_||X||_ 
            |_||_|  | _|  |  |  | _| _|
          STR
        end
        let(:output) { { account_number: '66?3714?5', legible: false, valid: false } }
      end
    end
  end

  context 'with individual number: 0' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::ZERO }
      let(:output) { { account_number: '0', legible: true, valid: false } }
    end
  end

  context 'with individual number: 1' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::ONE }
      let(:output) { { account_number: '1', legible: true, valid: false } }
    end
  end

  context 'with individual number: 2' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::TWO }
      let(:output) { { account_number: '2', legible: true, valid: false } }
    end
  end

  context 'with individual number: 3' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::THREE }
      let(:output) { { account_number: '3', legible: true, valid: false } }
    end
  end

  context 'with individual number: 4' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::FOUR }
      let(:output) { { account_number: '4', legible: true, valid: false } }
    end
  end

  context 'with individual number: 5' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::FIVE }
      let(:output) { { account_number: '5', legible: true, valid: false } }
    end
  end

  context 'with individual number: 6' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::SIX }
      let(:output) { { account_number: '6', legible: true, valid: false } }
    end
  end

  context 'with individual number: 7' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::SEVEN }
      let(:output) { { account_number: '7', legible: true, valid: false } }
    end
  end

  context 'with individual number: 8' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::EIGHT }
      let(:output) { { account_number: '8', legible: true, valid: false } }
    end
  end

  context 'with individual number: 9' do
    it_behaves_like 'a bank ocr processor' do
      let(:input) { BankOCRProcessor::NINE }
      let(:output) { { account_number: '9', legible: true, valid: false } }
    end
  end
end
