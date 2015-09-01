ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require "pry-rails"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def login_as(user, options = {})
    password = options[:password] || 'password'
    if integration_test?
      post login_path, session: { name: user.name,
                                  password: user.password}
    else

      session[:user_id] = user.id
    end
  end

  def logout
    session.delete :user_id
  end

  #def setup(user)
  #  login_as :user if defined? session
  #end

  private

    def integration_test?
      defined?(post_via_redirect)
    end

end
