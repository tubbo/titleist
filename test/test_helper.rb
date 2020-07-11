# typed: ignore
# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"
require "mocha"
require 'mocha/minitest'
require 'webdrivers'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

# Run tests in parallel
ActiveSupport::TestCase.parallelize(workers: :number_of_processors) if ActiveSupport::TestCase.respond_to?(:parallelize)

Capybara.server = :puma, { Silent: true }

# System test base class
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Rails.application.routes.url_helpers

  fixtures :all
  parallelize workers: :number_of_processors if respond_to? :parallelize
  driven_by :selenium,
            using: :chrome,
            screen_size: [1400, 1400],
            options: {
              desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                chromeOptions: {
                  args: %w[
                    headless
                    disable-gpu
                    disable-popup-blocking
                    --enable-features=NetworkService,NetworkServiceInProcess
                  ],
                  w3c: false
                }
              )
            }
end
