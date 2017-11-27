ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def ensure_logged_in
    @userpwd = "testpassword"
    @user = User.find_or_create_by name: "michael"
    @user.password = @userpwd
    @user.save!
    
    post sessions_url, params: { name: @user.name, password: @userpwd }
    assert_redirected_to root_url
  end
end
