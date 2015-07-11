require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:two)
    login_as(@user)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
