# typed: false
module Titleist
  # Helper methods in ActionView for rendering the title.
  module Helper
    # Render the full title as a `<title>` tag.
    def title_tag
      content_tag :title, title_text
    end

    private

    def title_text
      current_page?(root_path) ? title.app : title
    end
  end
end
