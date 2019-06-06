module Titleist
  # Object that turns passed-in scope details into a String of title
  # text derived from the +I18n+ locale configuration.
  class Title
    # Top-level scope in the i18n locale for all title configuration.
    ROOT_SCOPE = :titles

    # @!attribute controller [r]
    #   @return [String] Controller name of the current request.
    attr_reader :controller

    # @!attribute action [r]
    #   @return [String] Action name of the current request.
    attr_reader :action

    # @!attribute context [r]
    #   @return [Hash] Passed-in context from the helper method.
    attr_reader :context

    # @param controller [String] Current request controller name.
    # @param action [String] Current request action name.
    # @param context [Hash] Optional params passed in from the helper.
    def initialize(controller: '', action: '', context: {})
      @controller = controller
      @action = action
      @context = context
    end

    # Global application title.
    #
    # @return [String]
    def app
      I18n.t :application, context.merge(
        scope: ROOT_SCOPE,
        default: default_app_title
      )
    end

    # Page title from given scope.
    #
    # @return [String]
    def page
      @page ||= I18n.t action.to_sym, context.merge(
        scope: scope,
        default: default_page_title
      )
    end

    # @!attribute page [w]
    #   Override the given scope and set a new page title.
    #   @return [String]
    attr_writer :page

    # Format this title as a +String+.
    #
    # @return [String]
    def to_s
      return app if root?

      I18n.t :format, to_h
    end

    # Format this title as a +Hash+ of attributes.
    #
    # @return [Hash]
    def to_h
      {
        scope: ROOT_SCOPE,
        app: app,
        page: page
      }
    end

    # TODO: Necessary?
    def root?
      false
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

    # Scope for +I18n+ derived from the controller name and root.
    #
    # @private
    # @return [Array] Derived i18n scope.
    def scope
      @scope ||= [ROOT_SCOPE, controller]
    end
  end
end
