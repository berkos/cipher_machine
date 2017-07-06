# frozen_string_literal: true
require 'spec_helper'

RSpec.describe CipherMachine::Encryptor::PlainTextToMorseCode do
  describe '#convert' do
    subject { described_class.new.convert(input) }

    context 'when input is not a string' do
      let(:input) { 1 }

      it 'raises an Argument error' do
        expect { subject }.to raise_error(ArgumentError, 'Input has to be a string')
      end
    end

    context 'when input is an empty string' do
      let(:input) { '' }
      let(:expected_result) { '' }

      it 'returns an empty string' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'when input is a space' do
      let(:input) { ' ' }
      let(:expected_result) { '' }

      it 'returns an empty string' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'when input contains an invalid character' do
      let(:input) { '& AND' }

      it 'raises an InvalidLetter error' do
        expect { subject }.to raise_error(described_class::InvalidLetter)
      end
    end

    context 'when input is one word' do
      let(:input) { 'TROUBLE' }
      let(:expected_result) { '-|.-.|---|..-|-...|.-..|.' }

      it 'return the correct encrypted text' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'when input is a sentence' do
      let(:input) { 'I AM IN TROUBLE' }
      let(:expected_result) { '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.' }

      it 'return the correct encrypted text' do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
