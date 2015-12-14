class UserOptionsController < ApplicationController

  def options
    @user = User.find(current_user.id)
  end

  def edit_password
    @user = User.find(current_user.id)
  end

end
