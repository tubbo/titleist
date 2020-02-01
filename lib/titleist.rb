require 'active_support/all'

require 'titleist/version'
require 'titleist/engine'

# Serves standardized titles throughout your +Rails+ application,
# leveraging +I18n+ locale configuration and view helpers to make
# defining and presenting titles in any way you see fit as simple as
# possible.
#
# @example Setting a title
#   en:
#     titleist:
#       format: '%{app} | %{page}' # this is the default
#     application:
#       title: My App
#     pages:
#       index:
#         title: Home
#     posts:
#       show:
#         title: "Post %{name}"
#
# @example Rendering the current title
#   = title_tag
module Titleist
  extend ActiveSupport::Autoload

  autoload :Title
  autoload :Controller
  autoload :Helper
end
