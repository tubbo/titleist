require 'rails_helper'
require 'rails/generators'
require 'generators/titleist/titleist_generator'

RSpec.describe TitleistGenerator, type: :generator do
  destination Rails.root.join('tmp/generators')

  xit 'generates a locale file' do
    expect(File.exist?(file('config/locales/titleist.en.yml'))).to be true
  end

  xit 'edits the application layout' do
    expect(File.read(file('app/views/layouts/application.html.erb'))).to include('<%= title_tag %>')
  end
end
