require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userpwd = "testpassword"
    @user = User.find_or_create_by name: "michael"
    @user.password = @userpwd
    @user.save!
  end
  
  
  test "should get new" do
    get new_session_url
    assert_response :success
  end
  
  test "should login successfully" do
    post sessions_url, params: { name: @user.name, password: @userpwd }
    assert_redirected_to root_url
  end

  test "should not login successfully" do
    post sessions_url, params: { name: @user.name, password: "bad#{@userpwd}" }
    assert_response :success
  end

end
