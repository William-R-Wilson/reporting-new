class TransactionsController < ApplicationController
  before_filter :accounts_and_programs  #in application_controller
  
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
  
  before_filter :common_variables, only: [:index, :edit, :new]

  # GET /transactions
  # GET /transactions.json
  
  def common_variables
    if User.find_by(id: session[:user_id]).admin?
      @transactions = Transaction.all.order(:date)
    else
      @transactions = Transaction.where("user_id = ?", User.find_by(id: session[:user_id])) 
    end
    @all_amounts = @transactions.pluck(:amount)
    @total = @all_amounts.sum
  end
  
  def index

  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new    
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_user.transactions.build(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully created.' }
        format.json { redirect_to transactions_url, status: :created, location: @transaction }
      else
        format.html { redirect_to new_transaction_path }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    #@transaction = Transaction.find(params[:id])
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:date, :vendor, :who, :what, :where, :why, :string, :amount, :precision, :program, :account)
    end
end
