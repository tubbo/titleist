# Generate initial files for the gem to work.
class TitleistGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def copy_locale
    template 'locale.yml.erb', 'config/locales/titleist.en.yml'
  end

  def update_default_application_layout
    gsub_file(
      'app/views/layouts/application.html.erb',
      %r{\s\s\s\s<title>(.*)</title>},
      '    <%= title_tag %>'
    )
  end
end
