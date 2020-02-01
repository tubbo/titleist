require 'bundler/setup'
require 'bundler/gem_tasks'
require 'yard'
require 'rubocop/rake_task'
require 'rake/testtask'

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

desc 'Generate documentation'
YARD::Rake::YardocTask.new :doc

desc 'Run lint checks'
RuboCop::RakeTask.new :lint

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = false
end

task default: %i[lint test doc build]
