require 'rails_helper'

RSpec.describe TitleistHelper, type: :helper do
  before do
    allow(@controller).to receive_messages(
      controller_name: 'posts',
      action_name: 'show'
    )
  end

  it 'renders the current page title' do
    allow(title).to receive(:page).and_return('View "Test"')
    expect(helper.page_title).to eq 'View "Test"'
  end

  it 'renders the current app title' do
    expect(helper.app_title).to eq 'App'
  end

  it 'renders the full title' do
    expect(helper.title(name: 'Test').to_s).to eq('View "Test" | App')
  end

  it 'renders a <title> tag' do
    expect(helper.title_tag(name: 'Test')).to eq('<title>View "Test" | App</title>')
  end
end
