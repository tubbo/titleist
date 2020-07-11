# typed: false

module Titleist
  # Controller mixins for reading titles without ActionView
  module Controller
    extend ActiveSupport::Concern
    extend T::Sig

    included do
      helper_method :title, :app_title, :page_title
    end

    # Generate the full page title for this request. When output into the
    # view, the entire title is shown. You may also call +title.page+ or
    # +title.app+ to view individual pieces of the title.
    #
    # @return [Titleist::Title]
    def title
      @title ||= Title.new(**params.to_unsafe_h.deep_symbolize_keys)
    end

    # Shorthand for calling +title.app+ in the view.
    #
    # @return [String] i18n-configured global application title.
    def app_title
      title.app
    end

    # Shorthand for calling +title.page+ in the view.
    #
    # @return [String] i18n-configured title for the current page.
    def page_title
      title.page
    end
  end
end
