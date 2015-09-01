require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
#test admin user
  def setup
    @admin = users(:one)
    @nonadmin = users(:two)
    @account = accounts(:one)
  end

  test "admin should get new" do
    login_as(@admin)
    get :new
    assert_response :success
  end

  test "admin can create" do
    login_as(@admin)
    assert_difference "Account.count" do
      post :create, account: { name: "name" }
    end
    assert_redirected_to accounts_path
  end

  test "admin can destroy" do
    login_as(@admin)
    assert_difference "Account.count", -1 do
      delete :destroy, id: @account
    end
    assert_redirected_to accounts_path
  end

  test "admin can get index" do
    login_as(@admin)
    get :index
    assert_response :success
  end

  test "non admin cannot get index" do
    login_as(@nonadmin)
    get :index
    assert_redirected_to time_records_url
  end

  test "nonadmin cannot get new" do
    login_as(@nonadmin)
    get :new
    assert_redirected_to time_records_url
  end

  test "nonadmin cannot create" do
    login_as(@nonadmin)
    assert_no_difference "Account.count" do
      post :create, account: { name: "name" }
    end
    assert_redirected_to time_records_url
  end

  test "non_admin can destroy" do
    login_as(@nonadmin)
    assert_no_difference "Account.count" do
      delete :destroy, id: @account
    end
    assert_redirected_to time_records_url
  end

end
