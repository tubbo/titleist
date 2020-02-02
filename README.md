# Titleist

[![Tests](https://github.com/tubbo/titleist/workflows/Tests/badge.svg)](https://github.com/tubbo/titleist/actions)
[![Maintainability](https://codeclimate.com/github/tubbo/titleist/badges/gpa.svg)](https://codeclimate.com/github/tubbo/titleist)
[![Test Coverage](https://codeclimate.com/github/tubbo/titleist/badges/coverage.svg)](https://codeclimate.com/github/tubbo/titleist/coverage)

A powerful title helper for [Rails][] apps using [i18n][], with the
ability to override practically everything.

## Usage

Run the generator to get an example locale file and titles appearing in
your `<title>` tag.

```bash
rails generate titleist
```

### Configuration

Edit your **config/locales/titleist.en.yml** file to add your own titles and format:

```yaml
en:
  titleist:
    format: '%{page} | %{app}'
  layouts:
    application:
      title: My Application
  posts:
    index:
      title: View All Posts
    show:
      title: View Post
```

### Helpers

You can also use our fancy title helpers to generate your own titles.

For the full monty:

```erb
<title><%= title %></title>
<!-- or... %>
<%= title_tag %>
```

Page titles only:

```erb
<h1><%= page_title %></h1>
```

Or the app title only:

```erb
<p>Copyright &copy; 2015 <%= app_title %></p>
```

These methods are also available in the controller layer.

### Context

You can provide title context in your controllers for displaying things
like model data in the title.

```ruby
class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
    title[:post] = @post.title
  end
end
```

By default, all `params` are added to this context, and they can be read
by their keys in your i18n translations:

```yaml
en:
  posts:
    show:
      title: '%{post} (ID: %{post_id})'
```

### Overriding

The entire page title can be overridden if you wish:

```ruby
class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
    title.page = @post.title
  end
end
```

Or the app title:

```ruby
class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
    title.page = @post.title
    title.app = current_site.name
  end
end
```

### Defaults

Titelist attempts to derive default values if you do not configure them
in locales. For example, if the `.posts.new.title` translation can't be
found, the default title would be `"New Post"`, based on the name of the
controller and action.

The default title of your app is the name of the application module,
which is also what Rails considers to be the "app name".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'titleist'
```

And then run:

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
the CI build, and a failing build cannot be merged to 'master'. In
addition, Travis is responsible for building and pushing new gem
versions to [RubyGems][] when a new tag is pushed to Github.  This
library follows [Semantic Versioning][] to communicate the level of
change to end users.

## License

The gem is available as open source under the terms of the [MIT License][].

[Rails]: http://rubyonrails.org
[i18n]: http://guides.rubyonrails.org/i18n.html
[Code of Conduct]: CODE_OF_CONDUCT.md
[RubyGems]: http://rubygems.org
[Semantic Versioning]: http://semver.org
[MIT License]: MIT-LICENSE
