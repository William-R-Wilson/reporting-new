require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase

  def setup
    @admin = users(:one)
    @nonadmin = users(:two)
    @program = programs(:one)
  end

  test "admin should get new" do
    login_as(@admin)
    get :new
    assert_response :success
  end

  test "nonadmin should not get new" do
    login_as(@nonadmin)
    get :new
    assert_redirected_to time_records_url
  end

  test "admin should get create" do
    login_as(@admin)
    assert_difference "Program.count" do
      post :create, program: { name: "nameGoesHere" }
    end
    assert_redirected_to programs_path
  end

  test "nonadmin should not get create" do
    login_as(@nonadmin)
    assert_no_difference "Program.count" do
      post :create, program: { name: "nameGoesHere" }
    end
    assert_redirected_to time_records_url
  end

  test "admin should get destroy" do
    login_as(@admin)
    assert_difference "Program.count", -1 do
      delete :destroy, id: @program
    end
    assert_redirected_to programs_path
  end

  test "nonadmin should not get destroy" do
    login_as(@nonadmin)
    assert_no_difference "Program.count" do
      delete :destroy, id: @program
    end
    assert_redirected_to time_records_url
  end

  test "admin should get index" do
    login_as(@admin)
    get :index
    assert_response :success
  end

  test "nonadmin should not get index" do
    login_as(@nonadmin)
    get :index
    assert_redirected_to time_records_url
  end

end
