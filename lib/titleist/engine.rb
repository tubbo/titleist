module Titleist
  # Extensions into the Rails framework that mixin the controller and
  # helper modules when ActionController and ActionView are loaded.
  class Engine < Rails::Engine
    ActiveSupport.on_load :action_controller do
      include Titleist::Controller
    end

    ActiveSupport.on_load :action_view do
      include Titleist::Helper
    end
  end
end
