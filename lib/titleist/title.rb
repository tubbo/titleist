# typed: true

module Titleist
  # Object that turns passed-in scope details into a String of title
  # text derived from the +I18n+ locale configuration.
  class Title
    extend T::Sig

    # Default title format that can be overridden by changing the i18n
    # key `titelist.format`.
    FORMAT = '%{page} - %{app}'.freeze

    # @!method [](key)
    #   Read title context
    #
    #   @param [Symbol] key
    #   @return [String] the value or `nil`

    # @!method []=(key, value)
    #   Write title context
    #
    #   @param [Symbol] key
    #   @param [String] value

    # @!method to_str
    #   @return [String]

    delegate :[], :[]=, to: :@params
    delegate :to_str, to: :to_s

    # @param controller [String] Current request controller name.
    # @param action [String] Current request action name.
    # @param context [Hash] Optional params passed in from the helper.
    # @param root [Boolean] Whether this is the root path
    def initialize(controller:, action:, **params)
      @controller = controller
      @action = action
      @params = params
    end

    # Global application title.
    #
    # @return [String]
    sig { returns(String) }
    def app
      @app ||= I18n.t :title, @params.reverse_merge(
        scope: %i[layouts application],
        default: default_app_title
      )
    end

    # Page title from the current scope.
    #
    # @return [String]
    sig { returns(String) }
    def page
      @page ||= I18n.t :title, @params.reverse_merge(
        scope: [*controller_scope, @action],
        default: default_page_title
      )
    end

    # @!attribute page [rw]
    #   Override the current page title
    #   @return [String]
    attr_writer :page

    # Format the full page title.
    #
    # @return [String]
    sig { returns(String) }
    def to_s
      I18n.t :format, scope: :titleist, default: FORMAT, app: app, page: page
    end

    private

    sig { returns(String) }
    def default_app_title
      Rails.application.class.name&.deconstantize&.titleize.to_s
    end

    sig { returns(String) }
    def default_page_title
      return @controller.titleize if @action == 'index'

      [action_title, resource_title].join(' ')
    end

    sig { returns(String) }
    def action_title
      case @action
      when 'show'
        'View'
      when 'destroy'
        'Delete'
      else
        @action.titleize
      end
    end

    sig { returns(String) }
    def resource_title
      @controller.singularize.titleize
    end

    sig { returns(Array) }
    def controller_scope
      @controller.split('/')
    end
  end
end
