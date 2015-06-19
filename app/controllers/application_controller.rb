class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  before_action :authorize
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def accounts_and_programs
    @accounts = ["Participant Travel", "Staff Travel", "Board Travel", "Materials", "Technology Subscriptions", "Printing/Copying"]
    @programs = ["Admin", "Development", "Youth Programs", "Other Programs"]
  end 

    
  protected
  
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end    
    

      
    
end
