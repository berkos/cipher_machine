# frozen_string_literal: true

module CipherMachine
  class Application
    def initialize(input:, output:)
      raise(ArgumentError, 'Input should be IO') unless input.is_a?(IO)
      raise(ArgumentError, 'Output should be IO') unless output.is_a?(IO)

      @input = input
      @output = output
      @plain_text_to_morse_code = Encryptor::PlainTextToMorseCode.new
      @morse_code_to_obfuscated = Encryptor::MorseCodeToObfuscated.new
    end

    def encrypt
      while (sentence = input.gets&.chomp)
        output.puts(encrypt_sentence(sentence))
      end

      close_io
    end

    private

    attr_reader :input, :output, :plain_text_to_morse_code, :morse_code_to_obfuscated

    def encrypt_sentence(input)
      morse_code_to_obfuscated.convert(plain_text_to_morse_code.convert(input))
    rescue Encryptor::PlainTextToMorseCode::InvalidLetter => error
      error.message
    end

    def close_io
      input.close
      output.close
    end
  end
end
