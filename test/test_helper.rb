ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def sign_in_as(user)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end
end
