module Titleist
  # Extensions into the Rails framework.
  class Engine < Rails::Engine
    isolate_namespace Titleist
  end
end
