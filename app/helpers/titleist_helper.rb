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
end
