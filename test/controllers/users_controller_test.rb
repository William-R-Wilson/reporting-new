require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @nonadmin = users(:two)
    @admin = users(:one)
    @coord = users(:three)
  end

  test "non-admin cannot get new" do
    login_as(@coord)
    get :new
    assert_redirected_to time_records_url
  end

  test "non-admin cannot create user" do
    login_as(@coord)
    assert_no_difference('User.count') do
      post :create, user: { email: "Jimmy@jim.com", first_name: "jeb", last_name: "Bush", password: 'secretest', password_confirmation: 'secretest' }
    end
    assert_redirected_to time_records_url
  end

  test "regular user can show themselves" do
    login_as(@nonadmin)
    get :show, id: @nonadmin
    assert :success!
  end

  test "coordinator can show other users" do
    login_as(@coord)
    get :show, id: @nonadmin.id
    assert_response :success
  end

  test "non-admin cannot get edit" do
    login_as(@coord)
    get :edit, id: @nonadmin
    assert_redirected_to time_records_url
  end

  test "non-admin cannot update user" do
    login_as(@coord)
    patch :update, id: @nonadmin, user: { email: @nonadmin.email, first_name: @nonadmin.first_name, password: 'secretest', password_confirmation: 'secretest' }
    assert_redirected_to time_records_url
  end

  test "non-admin cannot get users index" do
    login_as(@nonadmin)
    get :index
    assert_redirected_to time_records_url
    assert_nil assigns(:users)
  end

end
