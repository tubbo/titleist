$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'titleist/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'titleist'
  s.version     = Titleist::VERSION
  s.authors     = ['Tom Scott']
  s.email       = ['tscott@weblinc.com']
  s.homepage    = 'https://tubbo.github.io/titleist'
  s.summary     = 'Powerful, i18n-abusing title helper for Rails apps'
  s.description = "#{s.description}. Improve your swing."
  s.license     = 'MIT'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }

  s.add_dependency 'rails'

  s.add_development_dependency 'capybara', '~> 3'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'rubocop', '~> 0.71'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'travis-release'
  s.add_development_dependency 'webdrivers'
  s.add_development_dependency 'yard', '~> 0.9'
end
