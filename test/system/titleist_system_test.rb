# typed: false
require 'test_helper'

class TitleistSystemTest < ApplicationSystemTestCase
  test 'show default app title on the home page' do
    visit root_path

    assert_text 'App'
  end

  test 'show page title on the posts#show page' do
    post = posts(:initial)

    visit post_path(post)

    assert_text 'View "Post Name"'
  end

  test 'show default title on the posts#index page' do
    visit posts_path

    assert_text 'Posts'
  end
end
