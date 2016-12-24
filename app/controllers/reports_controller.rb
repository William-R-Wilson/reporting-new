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
    @user ||= User.find_by(id: params[:user_id])
    @start_date = Date.civil(params[:start_date][:year].to_i,
                  params[:start_date][:month].to_i, 25)
    @end_date = Date.civil(params[:end_date][:year].to_i,
                params[:end_date][:month].to_i, 24)
    @user_id = params[:user_id] #why is this here?
    @transactions = Transaction.where(  'user_id = ? AND date BETWEEN ? AND ?',
                                        @user_id, @start_date, @end_date)
    @transactions_for_display = @transactions.paginate(:page => params[:page]).order(:date)
    @total = @transactions.pluck(:amount) #summed in the view
  end

  def csv_report
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @user_id = params[:user_id]
    @user = User.find_by(id: @user_id)
    @transactions = Transaction.where(  'user_id = ? AND date BETWEEN ? AND ?',
                                        @user_id, @start_date, @end_date)
    respond_to do |format|
      format.html
      format.csv { send_data @transactions.to_csv, filename: "report-#{@user.first_name}-#{@end_date}.csv"}
    end
  end


end
