require 'active_support/all'

require 'titleist/version'
require 'titleist/engine'

# Helper gem for rendering app and page titles derived from i18n locale
# configuration.
module Titleist
  extend ActiveSupport::Autoload

  autoload :Title
end
