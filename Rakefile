require 'bundler/setup'
require 'bundler/gem_tasks'
require 'yard'
require 'rubocop/rake_task'
require 'rake/testtask'

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

desc 'Generate documentation'
task :doc do
  sh 'bundle exec sord rbi/sord.rbi'
end

desc 'Run lint checks'
RuboCop::RakeTask.new :lint

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = false
  t.warning = false
end

desc 'Run type checks'
task :check do
  sh 'bundle exec srb tc'
end

task default: %i[doc lint test build]
