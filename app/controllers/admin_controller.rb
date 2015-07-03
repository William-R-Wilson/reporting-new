class AdminController < ApplicationController
  before_action :check_if_admin, :authorize
  
  def index
  end
  
  def new
  end
  
  def show
  end
  
end
