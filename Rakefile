require 'bundler/setup'
require 'yard'
require 'rubocop/rake_task'
require 'travis/release'
require 'rake/testtask'

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

desc 'Generate documentation'
YARD::Rake::YardocTask.new :doc

desc 'Run lint checks'
RuboCop::RakeTask.new :lint

# Release automatically with tag pushes to GitHub via Travis CI on
# to RubyGems.org
Travis::Release::Task.new

Bundler::GemHelper.install_tasks
