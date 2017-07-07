Feature: executable
  Run a an example to test the expected behaviour of the Cipher machine

  Scenario: Running ./bin/cipher_machine -I "data/input.txt" -O "output.text"
    When I run ./bin/cipher_machine -I "data/input.txt" -O "output.text"
    Then I should get the expected result that is in the file "output.text"

  Scenario: Running ./bin/cipher_machine -I data/input.txt
    When I run ./bin/cipher_machine -I "data/input.txt"
    Then I should get the expected output in STDOUT

