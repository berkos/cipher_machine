When(/^I run \.\/bin\/cipher_machine \-I "([^"]*)"$/) do |arg1|
  @output = IO.popen("./bin/cipher_machine -I #{arg1}")
  @output = @output.readlines
end

Then(/^I should get the expected output in STDOUT$/) do
  expected_output = ["4|1|1A2|1A2|C\n", "2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1\n"]
  expect(@output).to eq(expected_output)
end

When(/^I run \.\/bin\/cipher_machine \-I "([^"]*)" \-O "([^"]*)"$/) do |arg1, arg2|
  system("./bin/cipher_machine -I #{arg1} -O #{arg2}")
end

Then(/^I should get the expected result that is in the file "([^"]*)"$/) do |arg1|
  expected_output = ["4|1|1A2|1A2|C\n", "2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1\n"]
  output = File.readlines(arg1)
  expect(output).to eq(expected_output)

  # Clear file
  File.delete(arg1)
end
