class ReportsController < ApplicationController
  before_action :authorize
  before_filter :common_variables, :accounts_and_programs

  def common_variables
    if User.find_by(id: session[:user_id]).admin?
      @users_to_select = User.all.map{ |u| [ u.name, u.id ] }
    else
      @user = User.find_by(id: session[:user_id]) 
    end
  end
  
  
  # https://stackoverflow.com/questions/11563480/printing-stuff-in-rails-literally-to-a-printer
  # https://stackoverflow.com/questions/6406425/how-do-i-use-a-different-layout-for-a-specific-action
  
  # https://ariejan.net/2007/01/19/print-this-page-with-ruby-on-rails/
  
  def index
  end
  
  def new
  end

  def create
  
  end

  
  def show
    @user = User.find_by(id: params[:user_id])
    @start_date = Date.civil(params[:start_date][:year].to_i, 
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)  
    @end_date = Date.civil(params[:end_date][:year].to_i, 
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @user_id = params[:user_id]
    @transactions = Transaction.where(  'user_id = ? AND date BETWEEN ? AND ?', 
                                        @user_id, @start_date, @end_date)
    @transactions_for_display = @transactions.paginate(:page => params[:page]).order(:date)                                    
    @transactions_grouped_by_account = @transactions.group(:account)
    #group by program
    @transactions_grouped_by_program = @transactions_grouped_by_account.group(:program)
    @total_by_account = @transactions_grouped_by_account.sum(:amount)
    @total_by_program = @transactions_grouped_by_program.sum(:amount)
    @total = @transactions.pluck(:amount) #summed in the view
  end
  
  # http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-select_month
  
end