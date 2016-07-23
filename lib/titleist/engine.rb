module Titleist
  # Extensions into the Rails framework, including the
  # +Rails.configuration.titleist+ config which can optionally configure
  # the global application title.
  class Engine < Rails::Engine
    config.titleist = ActiveSupport::OrderedOptions.new
  end
end
