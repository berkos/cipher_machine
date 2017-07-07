# frozen_string_literal: true

module CipherMachine
  module Encryptor
    class MorseCodeToObfuscated
      InvalidLetter = Class.new(StandardError)
      LETTERS = ('A'..'E').to_a
      MAPPING = Hash[
        '.', ->(number) { number },
        '-', ->(number) { LETTERS[number - 1] }
        ]

      def convert(input)
        raise(ArgumentError, 'Input has to be a string') unless input.is_a?(String)

        invalid_letter = /[^.|\-\/]/.match(input)
        raise(InvalidLetter, "Invalid Letter: '#{invalid_letter}'") if invalid_letter

        input.gsub(/\.+|-+/) { |s| MAPPING[s[0]][s.size] }
      end

      private_constant :LETTERS, :MAPPING
    end
  end
end
