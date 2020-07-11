# typed: false

module Titleist
  # Helper methods in ActionView for rendering the title.
  module Helper
    extend T::Sig

    # Render the full title as a `<title>` tag.
    #
    # @return [String]
    def title_tag
      content_tag :title, title_text.to_s
    end

    private

    # @private
    # @return [String]
    def title_text
      current_page?(root_path) ? title.app : title
    end
  end
end
