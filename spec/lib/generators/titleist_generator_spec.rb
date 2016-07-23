require 'rails_helper'
require 'generators/titleist/titleist_generator'

RSpec.describe TitleistGenerator, type: :generator do
  destination Rails.root.join('tmp/generators')

  before do
    prepare_destination
    FileUtils.mkdir_p Rails.root.join('tmp/generators/app/views/layouts')
    FileUtils.cp(
      Rails.root.join('app/views/layouts/application.html.erb'),
      Rails.root.join('tmp/generators/app/views/layouts/application.html.erb')
    )
    run_generator
  end

  it 'generates a locale file' do
    expect(destination_root).to have_structure do
      directory 'config' do
        directory 'locales' do
          file 'titleist.en.yml' do
            contains 'titles:'
          end
        end
      end
    end
  end

  it 'edits the application layout' do
    expect(destination_root).to have_structure do
      directory 'app' do
        directory 'views' do
          directory 'layouts' do
            file 'application.html.erb' do
              contains '= title_tag'
            end
          end
        end
      end
    end
  end
end
