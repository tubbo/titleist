require 'test_helper'

class TitleistHelperTest < ActionView::TestCase
  setup do
    @title = Titleist::Title.new(
      controller: 'posts',
      action: 'show',
      context: { name: 'Test' }
    )
  end

  test 'page title' do
    assert_equal 'View "Test"', page_title
  end

  test 'app title' do
    assert_equal 'App', app_title
  end

  test 'full title' do
    assert_equal 'View "Test" | App', title.to_s
  end

  test 'title tag' do
    assert_equal '<title>View "Test" | App</title>', title_tag
  end
end
