class ReportsController < ApplicationController
  before_filter :common_variables, :accounts_and_programs
  before_action :authorize
  
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
    @user_id = params[:user_id]
    @transactions = Transaction.where('user_id = ? AND date BETWEEN ? AND ?', @user_id, @start_date, @end_date).order(:date)
    @transactions_grouped_by_account = @transactions.group(:account)
    #group by program
    @transactions_grouped_by_program = @transactions_grouped_by_account.group(:program)
    @total_by_account = @transactions_grouped_by_account.sum(:amount)
    @total_by_program = @transactions_grouped_by_program.sum(:amount)
    @total = @transactions.pluck(:amount) #needs to be summed in the view
  end
  
  # http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-select_month
  
end