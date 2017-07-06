# frozen_string_literal: true
require 'spec_helper'

RSpec.describe CipherMachine::Encryptor::MorseCodeToObfuscated do
  describe '#convert' do
    subject { described_class.new.convert(input) }

    context 'when input is not a string' do
      let(:input) { 1 }

      it 'raises an Argument error' do
        expect { subject }.to raise_error(ArgumentError, 'Input has to be a string')
      end
    end

    context 'when input is an invalid morse code' do
      let(:input) { 'I am an invalid morse code' }

      it 'raises an InvalidLetter error' do
        expect { subject }.to raise_error(described_class::InvalidLetter, "Invalid Letter: 'I'")
      end
    end

    context 'when input is an empty string' do
      let(:input) { '' }

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end

    context 'when input is a correct morse code' do
      let(:input) { '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.' }
      let(:expected_result) { '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1' }

      it 'returns the expected result' do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
