# frozen_string_literal: true
module CipherMachine
  module Encryptor
    class PlainTextToMorseCode
      InvalidLetter = Class.new(StandardError)
      MORSE_CODE = Hash[
        'A', '.-', 'N', '-.', 'B', '-...', 'O', '---', 'C', '-.-.', 'P', '.--.', 'D', '-..',
        'Q', '--.-', 'E', '.', 'R', '.-.', 'F', '..-.', 'S', '...', 'G', '--.', 'T', '-',
        'H', '....', 'U', '..-', 'I', '..', 'V', '...-', 'J', '.---', 'W', '.--', 'K',
        '-.-', 'X', '-..-', 'L', '.-..', 'Y', '-.--', 'M', '--', 'Z', '--..',
        '0', '-----', '1', '.----', '2', '..---', '3', '...--', '4', '....-', '5', '.....',
        '6', '-....', '7', '--...', '8', '---..', '9', '----.', '.', '.-.-.-', ',', '--..--',
      ]

      def convert(input)
        raise(ArgumentError, 'Input has to be a string') unless input.is_a?(String)
        invalid_letter = /[^A-Za-z0-9., ]/.match(input)
        raise(InvalidLetter, "Invalid Letter: '#{invalid_letter}'") if invalid_letter

        words = input.split(' ')

        words.map do |word|
          word.chars.map do |c|
            convert_letter(c)
          end.join('|')
        end.join('/')
      end

      private_constant :MORSE_CODE
      private

      def convert_letter(char)
        MORSE_CODE[char.upcase]
      end
    end
  end
end
