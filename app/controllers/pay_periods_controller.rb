

class PayPeriodsController < ApplicationController

  before_action :check_role, :authorize

  def index
    @periods = PayPeriod.all.order(date: :desc)
  end

  def show
    @period = PayPeriod.find(params[:id])
    @time_records = TimeRecord.where("date = ?", @period.date)
    @users = User.all
    @not_reported = not_reported
    @users_not_reported = users_not_reported
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

    def not_reported
      arr = []
      users = User.all
      period = PayPeriod.find(params[:id])
      #time_records = TimeRecord.where("date = ?", period.date)
      users.each do |u|
        if TimeRecord.where("user_id = ? and date = ?", u.id, period.date).empty?
          arr.push(u.id)
        end
      end
      return arr
    end

    def users_not_reported
      arr = not_reported
      users = []
      arr.each do |e|
        users.push(User.find_by(id: e))
      end
      return users
    end

end
