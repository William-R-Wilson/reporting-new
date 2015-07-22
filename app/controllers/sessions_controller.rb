class SessionsController < ApplicationController
  
  skip_before_action :authorize 
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #session[:user_id] = user.id
      log_in(user)
      remember user 
      redirect_back_or transactions_path
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url, notice: "Logged out"
  end
  
  
end
