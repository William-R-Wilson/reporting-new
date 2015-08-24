require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    login_as(@user)
    @program = programs(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, program: { name: "nameGoesHere" }
    assert_redirected_to programs_path
  end

  test "should get destroy" do
    delete :destroy, id: @program
    assert_redirected_to programs_path
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
