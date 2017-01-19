class TimeRecordsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authorize

  respond_to :html, :js

  def index
    if User.find_by(id: session[:user_id]).admin?
      @timerecords = TimeRecord.all.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    elsif User.find_by(id: session[:user_id]).coordinator?
        @timerecords = TimeRecord.all.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    else
      @timerecords = TimeRecord.where("user_id = ?", User.find_by(id: session[:user_id])).paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    end
  end

  def csv_index
    @time_records = TimeRecord.all
    respond_to do |format|
      format.html
      format.csv { send_data @time_records.to_csv, filename: "time-records-#{Date.today}.csv"}
    end
  end

  def show
    @timerecord = TimeRecord.find(params[:id])
    @user_name = current_user.first_name
  end

  def new
    @timerecord = TimeRecord.new
    @user_name = current_user.first_name
    @pay_periods = PayPeriod.pluck(:date)
  end


  def edit
    @timerecord = TimeRecord.find(params[:id])
    @pay_periods = PayPeriod.pluck(:date)
  end

  def create
    @timerecord = current_user.time_records.create(timerecord_params)
    respond_to do |format|
      if @timerecord.save
        format.html { redirect_to time_record_url(@timerecord), notice: 'Time was successfully recorded.' }
        format.json { redirect_to time_record_url(@timerecord), status: :created, location: @timerecord }
      else
        format.html { redirect_to new_time_record_url, notice: "There were errors in your submission, please try again" }
        format.json { render json: @timerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    @timerecord = TimeRecord.find(params[:id])
    respond_to do |format|
      if @timerecord.update(timerecord_params)
        format.html { redirect_to time_records_url, notice: 'Time Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @timerecord }
      else
        format.html { render :edit }
        format.json { render json: @timerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timerecord = TimeRecord.find(params[:id])
    @timerecord.destroy
    respond_to do |format|
      format.html { redirect_to time_records_url, notice: 'Time Record was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def timerecord_params
      params.require(:time_record).permit(:user_id, :hours, :vacation, :sick, :date, :holiday, :bereavement, :jury_duty, :inclement_weather)
    end

    def sort_column
      TimeRecord.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
