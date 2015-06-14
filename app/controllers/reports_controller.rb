class ReportsController < ApplicationController
  before_filter :common_variables
  
  def common_variables
    @users_to_select = User.all.map{ |u| [ u.name, u.id ] }
  end
  
  def index
  end
  
  def new
  end

  def create
  
  end

  
  def show
    @user = User.find_by(id: params[:user_id])
    @start_date = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    user_id = params[:user_id]
    @transactions = Transaction.where('user_id = ? AND date BETWEEN ? AND ?', user_id, @start_date, @end_date)
  end


# https://stackoverflow.com/questions/4834348/how-can-i-search-by-a-range-of-dates-in-rails
  
  #def user_report
  #  @user = User.find_by(id: params[:user_id])
  #  @transactions = @user.transactions
  #end
  
end