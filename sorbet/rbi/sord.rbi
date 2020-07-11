# typed: strong
# typed: false
module Titleist
  extend ActiveSupport::Autoload
  VERSION = T.let('1.0.0'.freeze, T.untyped)

  # Object that turns passed-in scope details into a String of title
  # text derived from the +I18n+ locale configuration.
  class Title
    extend T::Sig
    FORMAT = T.let('%{page} - %{app}'.freeze, T.untyped)

    # Read title context
    # 
    # _@param_ `key`
    # 
    # _@return_ — the value or `nil`
    sig { params(key: Symbol).returns(String) }
    def [](key); end

    # Write title context
    # 
    # _@param_ `key`
    # 
    # _@param_ `value`
    # 
    # _@return_ — the value
    sig { params(key: Symbol, value: String).returns(String) }
    def []=(key, value); end

    # Allows for conversion of this object into a String for
    # ActionView
    sig { returns(String) }
    def to_str; end

    # _@param_ `controller` — - Current request controller name.
    # 
    # _@param_ `action` — - Current request action name.
    # 
    # _@param_ `context` — - Optional params passed in from the helper.
    sig { params(controller: String, action: String, context: T::Hash[T.untyped, T.untyped]).void }
    def initialize(controller:, action:, **context); end

    # Global application title.
    sig { returns(String) }
    def app; end

    # Format the full page title.
    sig { returns(String) }
    def to_s; end

    sig { returns(String) }
    def default_app_title; end

    sig { returns(String) }
    def default_page_title; end

    sig { returns(String) }
    def action_title; end

    sig { returns(String) }
    def resource_title; end

    sig { returns(String) }
    def controller_scope; end

    # Override the current page title
    sig { returns(T.any(String, T.untyped)) }
    attr_accessor :page
  end

  # Extensions into the Rails framework that mixin the controller and
  # helper modules when ActionController and ActionView are loaded.
  class Engine < Rails::Engine
  end

  # Helper methods in ActionView for rendering the title.
  module Helper
    extend T::Sig

    # Render the full title as a `<title>` tag.
    sig { returns(String) }
    def title_tag; end

    sig { returns(String) }
    def title_text; end
  end

  # Controller mixins for reading titles without ActionView
  module Controller
    extend ActiveSupport::Concern
    extend T::Sig

    # Generate the full page title for this request. When output into the
    # view, the entire title is shown. You may also call +title.page+ or
    # +title.app+ to view individual pieces of the title.
    sig { returns(Titleist::Title) }
    def title; end

    # Shorthand for calling +title.app+ in the view.
    # 
    # _@return_ — i18n-configured global application title.
    sig { returns(String) }
    def app_title; end

    # Shorthand for calling +title.page+ in the view.
    # 
    # _@return_ — i18n-configured title for the current page.
    sig { returns(String) }
    def page_title; end
  end
end

# typed: true
# Generate initial files for the gem to work.
class TitleistGenerator < Rails::Generators::Base
  # sord omit - no YARD return type given, using T.untyped
  sig { returns(T.untyped) }
  def copy_locale; end

  # sord omit - no YARD return type given, using T.untyped
  sig { returns(T.untyped) }
  def update_default_application_layout; end
end
