

class PayPeriodsController < ApplicationController
  
  before_action :check_if_admin, :authorize
  
  def index
    @periods = PayPeriod.all
  end
  
  def show
    @period = PayPeriod.find(params[:id])
    @time_records = TimeRecord.where("date = ?", @period.date)
    @users = User.all
  end


  
  def new
    @period = PayPeriod.new
  end 
  
  def create
    @period = PayPeriod.new(period_params)
    respond_to do |format|
      if @period.save
        format.html { redirect_to pay_periods_path, notice: "Pay Period was successfully created." }
        format.json { render :show, status: :created, location: @period }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @period = PayPeriod.find(params[:id])
  end 

  def update
    @period = PayPeriod.find(params[:id])
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to pay_periods_path, notice: 'Time Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @period }
      else
        format.html { render :edit }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end 
  
  def destroy
    @period = PayPeriod.find(params[:id])  
    @period.destroy
    respond_to do |format|
      format.html { redirect_to pay_periods_path, notice: 'Pay Period was successfully deleted.' }
      format.json { head :no_content }
    end
  end 
  
  private
  
    def period_params
      params.require(:pay_period).permit(:id, :date)
    end  


end