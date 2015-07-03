require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:two)
    login_as(@user)
  end
  
  test "non-admin cannot get new" do
    get :new
    assert_redirected_to transactions_url
  end

  test "non-admin cannot create user" do
    assert_no_difference('User.count') do
      post :create, user: { email: "Jimmy@jim.com", name: "jeb", password: 'secret', password_confirmation: 'secret' }
    end
    assert_redirected_to transactions_url
  end

  test "non-admin cannot show user" do
    get :show, id: @user
    assert_redirected_to transactions_url
  end

  test "non-admin cannot get edit" do
    get :edit, id: @user
    assert_redirected_to transactions_url
  end

  test "non-admin cannot update user" do
    patch :update, id: @user, user: { email: @user.email, name: @user.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to transactions_url
  end

  test "non-admin cannot get users index" do 
    get :index
    assert_redirected_to transactions_url
    assert_nil assigns(:users)
  end  

  class AdminUsersTest < UsersControllerTest

    setup do
      @user = users(:one)
      @other_user = users(:two)

    end

    test "admin can get get users index" do
      login_as(@user)
      puts @user.admin?
      puts @other_user.admin?
      assert_equal @user.id, session[:user_id]
      get :index
      puts response.body
      assert_response :success
      #assert_not_nil assigns(:users)
    end
    
=begin
  test "admin can get new" do
    get :new
    puts response.body
    assert_response :success
  end

  test "admin can create user" do
    assert_difference('User.count') do
      post :create, user: { email: "Jimmy@jim.com", name: "jeb", password: 'secret', password_confirmation: 'secret' }
    end

    assert_redirected_to users_url
  end

  test "admin can show user" do
    get :show, id: @user
    puts response.body
    assert_response :success
  end

  test "admin can get edit" do
    get :edit, id: @user
    puts response.body
    assert_response :success
  end

  test "admin can update user" do
    patch :update, id: @user, user: { email: @user.email, name: @user.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to users_path
  end
=end
  end

end


