require 'bundler/setup'
require 'yard'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

desc 'Generate documentation'
YARD::Rake::YardocTask.new :doc

desc 'Run all tests'
RSpec::Core::RakeTask.new :test

desc 'Run lint checks'
RuboCop::RakeTask.new :lint

Bundler::GemHelper.install_tasks

task default: %i(lint test build)
