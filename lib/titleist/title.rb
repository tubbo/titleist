module Titleist
  # Object that turns passed-in scope details into a String of title
  # text derived from the +I18n+ locale configuration.
  class Title
    # Top-level scope in the i18n locale for all title configuration.
    ROOT_SCOPE = :titles

    # @!attribute [r]
    #   @return [String] Controller name of the current request.
    attr_reader :controller

    # @!attribute [r]
    #   @return [String] Action name of the current request.
    attr_reader :action

    # @!attribute [r]
    #   @return [Hash] Passed-in context from the helper method.
    attr_reader :context

    # @option [String] :controller - Current request controller name.
    # @option [String] :action - Current request action name.
    # @option [Hash] :context - Optional params passed in from the helper.
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

    # Override the given scope and set a new page title.
    #
    # @param [String] new_title
    # @return [String]
    attr_writer :page

    def to_s
      return app if root?
      I18n.t :format, to_h
    end

    def to_h
      {
        scope: ROOT_SCOPE,
        app: app,
        page: page
      }
    end

    def root?
      false
    end

    private

    # @private
    # @return [String] Default app title guessed from module name.
    def default_app_title
      Rails.application.class.name.deconstantize.titleize
    end

    def default_page_title
      return controller.titleize if action == 'index'
      [action_title, resource_title].join(' ')
    end

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

    def resource_title
      controller.singularize.titleize
    end

    # @private
    # @return [String] i18n scope derived from controller name and root.
    def scope
      @scope ||= [ROOT_SCOPE, controller]
    end
  end
end
