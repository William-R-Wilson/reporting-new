require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:one)
    @non_admin = users(:two)
  end
  
  test "index as admin including delete link" do
    login_as(@admin)
    get users_path
    assert_template layout: "application"
    assert_difference "User.count", -1 do
      delete user_path(@non_admin)
    end
  end
    
    
end