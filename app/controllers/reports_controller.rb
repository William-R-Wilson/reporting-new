class ReportsController < ApplicationController
  before_action :authorize
  before_filter :common_variables

  def common_variables
    if User.find_by(id: session[:user_id]).admin?
      @users_to_select = User.all.map{ |u| [ u.first_name + " " + u.last_name, u.id ] }
    else
      @user = User.find_by(id: session[:user_id])
    end
  end

  def index
  end

  def new
  end

  def create

  end


  def show
    @user = User.find_by(id: params[:user_id])  #why is this in here twice? - see Common_variables
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @user_id = params[:user_id] #why is this here?
    @transactions = Transaction.where(  'user_id = ? AND date BETWEEN ? AND ?',
                                        @user_id, @start_date, @end_date)
    @transactions_for_display = @transactions.paginate(:page => params[:page]).order(:date)

    #need to rework the totals by accounts and programs - not sure if I'll be using this feature.  Old code below:
    #@transactions_grouped_by_account = @transactions.group(:account)
    #group by program
    #@transactions_grouped_by_program = @transactions_grouped_by_account.group(:program)
    #@total_by_account = @transactions_grouped_by_account.sum(:amount)
    #@total_by_program = @transactions_grouped_by_program.sum(:amount)

    @total = @transactions.pluck(:amount) #summed in the view
  end

  # http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-select_month

end
