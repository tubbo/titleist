class TitleistGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_locale
    copy_file 'config/locales/en.yml', 'config/locales/titleist.en.yml'
  end

  def update_application_layout
    gsub_file 'app/views/layouts/application.html.erb', %r{<title>(.*)</title>}, '<%= title_tag %>'
  end
end
