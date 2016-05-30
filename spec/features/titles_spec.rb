require 'rails_helper'

RSpec.feature 'Titles', type: :feature do
  fixtures :posts

  let :post do
    posts :initial
  end

  scenario 'show default app title on the home page' do
    visit root_path
    expect(page).to have_content 'App'
  end

  scenario 'show page title on the posts#show page' do
    visit post_path(post)
    expect(page).to have_content 'View "Post Name"'
  end

  scenario 'show default title on the posts#index page' do
    visit posts_path
    expect(page).to have_content 'Posts'
  end
end
