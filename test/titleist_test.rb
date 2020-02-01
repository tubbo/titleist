# typed: false
require 'test_helper'

class TitleistTest < ActiveSupport::TestCase
  test 'autoloads constants' do
    refute_nil Titleist::VERSION
  end
end
