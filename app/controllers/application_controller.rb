class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  protect_from_forgery with: :exception
  include SessionsHelper


  protected

    def authorize
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Please log in"
      end
    end

    def check_role
      unless User.find_by(id: session[:user_id]).admin? || User.find_by(id: session[:user_id]).coordinator?
        redirect_to time_records_url, notice: "You are not authorized for this action"
      end
    end

    def check_if_admin
      unless User.find_by(id: session[:user_id]).admin?
        redirect_to time_records_url, notice: "You are not authorized for this action"
      end
    end

    def check_if_coordinator
      unless User.find_by(id: session[:user_id]).coordinator?
        redirect_to time_records_url, notice: "You are not authorized for this action"
      end
    end
end
