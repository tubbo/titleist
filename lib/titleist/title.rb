module Titleist
  # Object that turns passed-in scope details into a String of title
  # text derived from the +I18n+ locale configuration.
  class Title
    DEFAULT_FORMAT = '%{page} - %{app}'.freeze

    # @!attribute controller [r]
    #   @return [String] Controller name of the current request.
    attr_reader :controller

    # @!attribute action [r]
    #   @return [String] Action name of the current request.
    attr_reader :action

    # @!attribute context [rw]
    #   @return [Hash] Passed-in context from the helper method.
    attr_accessor :context

    delegate :[], :[]=, to: :context
    delegate :to_str, to: :to_s

    # @param controller [String] Current request controller name.
    # @param action [String] Current request action name.
    # @param context [Hash] Optional params passed in from the helper.
    # @param root [Boolean] Whether this is the root path
    def initialize(controller:, action:, root: false)
      @controller = controller
      @action = action
      @context = {}
      @root = root
    end

    # Global application title.
    #
    # @return [String]
    def app
      @app ||= I18n.t :title, context.reverse_merge(
        scope: :application,
        default: default_app_title
      )
    end

    # Page title from the current scope.
    #
    # @return [String]
    def page
      @page ||= I18n.t :title, context.reverse_merge(
        scope: [*demodulized_controller, action],
        default: default_page_title
      )
    end

    # @!attribute page [rw]
    #   Override the current page title
    #   @return [String]
    attr_writer :page

    # Format this title as a +String+.
    #
    # @return [String]
    def to_s
      return app if root?

      I18n.t :title_format, scope: :application, default: DEFAULT_FORMAT
    end

    # Whether the page we're generating a title for is the root path.
    # This will cause no page title to display, and is set when the
    # title object is instantiated.
    #
    # @return [Boolean]
    def root?
      @root
    end

    private

    # Use the default configured app title in +Rails.configuration+ or
    # the derived app title if one is not specified.
    #
    # @private
    # @return [String] Default application title from module or config.
    def default_app_title
      Rails.configuration.titleist.app_title || derived_app_title
    end

    # Derive app title by titleizing the application module name if one
    # is not configured.
    #
    # @private
    # @return [String] Default app title guessed from module name.
    def derived_app_title
      Rails.application.class.name.deconstantize.titleize
    end

    # Default title of the current page, if one cannot be found.
    #
    # @private
    # @return [String] Action title combined with resource title.
    def default_page_title
      return controller.titleize if action == 'index'

      [action_title, resource_title].join(' ')
    end

    # Default title verb for the current action.
    #
    # @private
    # @return [String] "View", "Delete", or the titleized +action+.
    def action_title
      case action
      when 'show'
        'View'
      when 'destroy'
        'Delete'
      else
        action.titleize
      end
    end

    # Default title of the resource the controller is operating on.
    #
    # @private
    # @return [String] Singularized controller name.
    def resource_title
      controller.singularize.titleize
    end

    def demodulized_controller
      controller.split('/').map(&:to_sym)
    end
  end
end
