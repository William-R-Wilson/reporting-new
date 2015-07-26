require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    spock = users(:one)
    post :create, email: spock.email, password: 'secretest'
    assert_redirected_to transactions_path
    assert_equal spock.id, session[:user_id]
  end
  
  test "should fail login" do 
    spock = users(:one)
    post :create, email: spock.email, password: "wrong"
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end

end
