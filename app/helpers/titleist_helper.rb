# Helper methods included into +ActionView+ for rendering the current
# page and application title.
module TitleistHelper
  # Full +<title>+ tag renderer that uses the current page title and
  # wraps it in the proper HTML element.
  #
  # @return [ActiveSupport::SafeBuffer]
  def title_tag(context = {})
    content_tag :title, title(context).to_s.html_safe
  end

  # Generate the full page title for this request. When output into the
  # view, the entire title is shown. You may also call +title.page+ or
  # +title.app+ to view individual pieces of the title.
  #
  # @return [Titleist::Title]
  def title(context = {})
    @title ||= Titleist::Title.new(
      controller: controller.controller_name,
      action: controller.action_name,
      context: context,
      root: current_path?(root_path)
    )
  end

  # Override the current page title.
  #
  # @param [String] new_title
  # @return [String]
  def title=(new_title)
    title.page = new_title
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
