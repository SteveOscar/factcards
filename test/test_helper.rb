ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'database_cleaner'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

class ActionController::TestCase
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

def log_in_as(user, options = {})
  password = options[:password] || 'password'
  if integration_test?
    post login_path, session: { email:       user.email,
                                password:    password,}
  else
    session[:user_id] = user.id
  end
end

private

# Returns true inside an integration test.
def integration_test?
  defined?(post_via_redirect)
end
