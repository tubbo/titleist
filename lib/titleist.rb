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
#     titles:
#       application: My App
#       format: '%{app} | %{page}'
#       pages:
#         index: Home
#       posts:
#         index: All Posts
#         show: "Post %{name}"
#         new: New Post
#
# @example Rendering the current title
#   = title_tag
module Titleist
  extend ActiveSupport::Autoload

  autoload :Title
  autoload :Controller
end
