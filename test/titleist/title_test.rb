require 'test_helper'

module Titleist
  class TitleTest < ActiveSupport::TestCase
    setup do
      @params = {
        post_id: 1,
        post: 'Test'
      }
      @title = Title.new(controller: 'posts', action: 'show', **@params)
    end

    test 'find app title from i18n' do
      assert_equal 'App', @title.app
    end

    test 'guess app title when not found' do
      options = @params.reverse_merge(
        scope: %i[layouts application],
        default: 'Dummy'
      )

      I18n.stubs(:t).with(:title, options).returns('Dummy')

      assert_equal 'Dummy', @title.app
    end

    test 'find page title from i18n' do
      assert_equal 'View "Test"', @title.page
    end

    test 'guess page title when not found' do
      options = @params.reverse_merge(
        scope: %w[posts show],
        default: 'View Post'
      )

      I18n.stubs(:t).with(:title, options).returns('View Post')

      assert_equal 'View Post', @title.page
    end

    test 'override page title' do
      @title.page = 'Test'

      assert_equal 'Test | App', @title.to_s
    end

    test 'format title as string' do
      full_title = 'View "Test" | App'

      assert_equal full_title, @title.to_s
      assert_equal full_title, @title.to_str
    end
  end
end
