# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CipherMachine::Application do
  describe '.new' do
    subject { described_class.new(input: input_source, output: output_source) }
    context 'when input is not an IO' do
      let(:input_source) { Class.new }
      let(:output_source) { STDOUT }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError, 'Input should be IO')
      end
    end

    context 'when output is not IO' do
      let(:input_source) { STDIN }
      let(:output_source) { Class.new }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError, 'Output should be IO')
      end
    end

    context 'when input and output is IO' do
      let(:input_source) { STDIN }
      let(:output_source) { STDOUT }

      it 'does not raises any error' do
        expect { subject }.not_to raise_error
      end
    end
  end

  describe '#encrypt' do
    let(:input_source) { STDIN }
    let(:output_source) { STDOUT }

    subject { described_class.new(input: input_source, output: output_source) }

    before do
      allow(input_source).to receive(:gets).and_return(*inputs)
      allow(output_source).to receive(:puts)
      allow(input_source).to receive(:close)
      allow(output_source).to receive(:close)
    end

    context 'when input is an empty line' do
      let(:inputs) { ["\n", nil] }

      it 'outputs an empty string' do
        expect(output_source).to receive(:puts).with('')

        subject.encrypt
      end
    end

    context 'when input is one line' do
      let(:inputs) { ["I AM IN TROUBLE\n", nil] }
      let(:expected_output) { '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1' }

      it 'outputs the expected result' do
        expect(output_source).to receive(:puts).with(expected_output)

        subject.encrypt
      end
    end

    context 'when input is multi lines' do
      let(:inputs) { ['HELLO', "I AM IN TROUBLE\n", nil] }
      let(:expected_output) { ['4|1|1A2|1A2|C', '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'] }

      it 'outputs the expected result' do
        expect(output_source).to receive(:puts).once.with(expected_output[0])
        expect(output_source).to receive(:puts).once.with(expected_output[1])

        subject.encrypt
      end
    end

    context 'when one of the inputs contains a character that is not supported' do
      let(:inputs) { ['HELLO', "I AM IN &&&\n", nil] }
      let(:expected_output) { ['4|1|1A2|1A2|C', "Invalid Letter: '&'"] }

      it 'outputs the error' do
        expect(output_source).to receive(:puts).once.with(expected_output[1])
        expect(output_source).to receive(:puts).once.with(expected_output[0])

        subject.encrypt
      end
    end
  end
end
