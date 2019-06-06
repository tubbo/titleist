require 'test_helper'

module Titleist
  class TitleTest < ActiveSupport::TestCase
    setup do
      @title = Title.new(
        controller: 'posts',
        action: 'show',
        context: { name: 'Test' }
      )
    end

    test 'find app title from i18n' do
      assert_equal 'App', @title.app
    end

    test 'guess app title when not found' do
      I18n.stubs(:t)
          .with(:application, name: 'Test', scope: :titles, default: 'Dummy')
          .returns('Dummy')

      assert_equal 'Dummy', @title.app
    end

    test 'find page title from i18n' do
      I18n.stubs(:t)
          .with(
            :show,
            name: 'Test',
            scope: %i[titles posts],
            default: 'View Post'
          )
          .returns('View "Test"')

      assert_equal 'View "Test"', @title.page
    end

    test 'generates full title' do
      assert_equal 'View "Test" | App', @title.to_s
    end

    test 'only shows app title on root path' do
      @title.instance_variable_set('@root', true)

      assert_equal 'App', @title.to_s
    end

    test 'compiles i18n context from attributes' do
      context = {
        scope: Title::ROOT_SCOPE,
        app: 'App',
        page: 'View "Test"'
      }

      assert_equal context, @title.to_h
    end
  end
end
