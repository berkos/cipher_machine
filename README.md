## Objective

### Premise

You're competing in a battle on a far away planet and you're in some trouble. You need to send a distress call to your home base for reinforcements, however, enemy agents are listening. Luckily your team have a secret encoding for messages. It's Morse code with further obfuscation.

### Challenge

Write a program that will accept text either from stdin, or as a file path and will translate the alphanumeric sentence to Morse code. Then for bonus points, obfuscate the Morse code. Below is a list of international Morse code and the algorithm for obfuscation. Separate letters with pipe (|), and separate words with forward slash (/).

## How to run the app
1. Open a terminal
2. cd to root directory
3. `bundle install` ( probably you might have to install first the bundler by running: `gem install bundler` )
4. Then you can run the app with different combinations

  a) `./bin/cipher_machine` uses STDIN and STDOUT

  b) `./bin/cipher_machine -I data/input.txt` reads from data/input.txt and 
 outputs to STDOUT

  c) `./bin/cipher_machine -I data/input.txt -O output.txt` reads from data/input.txt and 
 outputs to the given file

  d) `./bin/cipher_machine -O output.txt` reads STDIN and 
 outputs to the given file


## Run the tests
 The App is provided with some tests whose purpose is to prove the correctness of the App and find any possible
  breakage of the existing code in future alteration of the app.
To Run the feature tests that test the executable and the rspec tests you can run

`bundle exec rake tests`


Berkakis Antonis
