class UserPolicy < ApplicationPolicy
  attr_reader :user, :new_user
  
  def initialize(user, new_user)
    @user = user
    @new_user = new_user
  end
  
  def new?
    user.admin?
  end
   
end