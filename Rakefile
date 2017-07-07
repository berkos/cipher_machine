# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new

desc 'Run rspec + cucumber'
task tests: %i[cucumber spec]
