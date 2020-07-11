$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'titleist/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'titleist'
  s.version     = Titleist::VERSION
  s.authors     = ['Tom Scott']
  s.email       = ['tubbo@psychedeli.ca']
  s.homepage    = 'https://tubbo.github.io/titleist'
  s.summary     = 'Powerful, i18n-abusing title helper for Rails apps'
  s.description = "#{s.description}. Improve your swing."
  s.license     = 'MIT'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }

  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'sorbet-runtime', '~> 0'
end
