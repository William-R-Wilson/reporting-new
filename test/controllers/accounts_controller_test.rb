require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    login_as(@user)
    @account = accounts(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, account: { name: "name" }
    assert_redirected_to accounts_path
  end

  test "should get destroy" do
    delete :destroy, id: @account
    assert_redirected_to accounts_path
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
