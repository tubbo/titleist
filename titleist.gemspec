$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'titleist/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'titleist'
  s.version     = Titleist::VERSION
  s.authors     = ['Tom Scott']
  s.email       = ['tscott@weblinc.com']
  s.homepage    = 'https://github.com/tubbo/titleist.git'
  s.summary     = 'Powerful, i18n-abusing title helper for Rails apps'
  s.description = "#{s.description}. Improve your swing."
  s.license     = 'MIT'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }

  s.add_dependency 'rails'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'codeclimate-test-reporter'
end
