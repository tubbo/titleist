# Titleist

A powerful title helper for [Rails][] apps that uses/abuses [i18n][] and allows
for maximum override potential.

## Usage

Run the generator to get an example locale file and titles appearing in
your `<title>` tag.

```bash
rails generate titleist
```

Edit your **config/locales/titleist.en.yml** file to add your own titles and format:

```yaml
en:
  titles:
    application: My Application
    format: '%{page} | %{app}'
    posts:
      index: View All Posts
      show: View Post
```

You can also use our fancy title helpers to generate your own titles.

For the full monty:

```erb
<title><%= title %></title>
```

Page titles only:

```erb
<h1><%= page_title %></h1>
```

Or the app title only:

```erb
<p>Copyright &copy; 2015 <%= app_title %></p>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'titleist'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install titleist
```

## Contributing

Please include tests and submit changes in a pull request. Read our
[Code of Conduct][] to find more information on expected behavior and
how to resolve issues. All changes to the codebase are verified using
the [Travis CI][] build, and a failing build cannot be merged to
'master'. In addition, Travis is responsible for building and pushing
new gem versions to [RubyGems][] when a new tag is pushed to Github.
This library follows [Semantic Versioning][] to communicate the level of
change to end users.

## License

The gem is available as open source under the terms of the [MIT License][].

[Rails]: http://rubyonrails.org
[i18n]: http://guides.rubyonrails.org/i18n.html
[Code of Conduct]: CODE_OF_CONDUCT.md
[Travis CI]: http://travis-ci.org
[RubyGems]: http://rubygems.org
[Semantic Versioning]: http://semver.org
[MIT License]: MIT-LICENSE
