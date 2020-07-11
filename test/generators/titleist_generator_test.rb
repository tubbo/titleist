# typed: false
require 'test_helper'
require 'generators/titleist/titleist_generator'

class TitleistGeneratorTest < Rails::Generators::TestCase
  tests TitleistGenerator
  destination Rails.root.join('tmp', 'generators')

  setup :prepare_destination
  setup :create_application_layouts
  setup :run_generator

  test 'generates a locale file' do
    assert_file 'config/locales/titleist.en.yml'
  end

  test 'edits application layout' do
    assert_file 'app/views/layouts/application.html.erb', /= title_tag/
  end

  private

  def create_application_layouts
    FileUtils.mkdir_p Rails.root.join('tmp/generators/app/views/layouts')
    FileUtils.cp(
      Rails.root.join('app/views/layouts/original.html.erb'),
      Rails.root.join('tmp/generators/app/views/layouts/application.html.erb')
    )
  end
end
