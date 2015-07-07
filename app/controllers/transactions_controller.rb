class TransactionsController < ApplicationController
  #before_filter :accounts_and_programs  #in application_controller
  
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
  
  before_filter :common_variables

  # GET /transactions
  # GET /transactions.json
  
  def common_variables
    if User.find_by(id: session[:user_id]).admin?
      @transactions = Transaction.all.paginate(:page => params[:page]).order(:date)
    else
      @transactions = Transaction.where("user_id = ?", User.find_by(id: session[:user_id])).paginate(:page => params[:page]).order(:date) 
    end
    @all_amounts = @transactions.pluck(:amount)
    @total = @all_amounts.sum  #this only sums what's on the page.  might not be needed on index view?
    @programs = Program.all.map { |program, id| [program.name, program.id] }
    @accounts = Account.all.map { |account, id| [account.name, account.id] }
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
    @user_name = current_user.name
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
        format.html { render :new }
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
      params.require(:transaction).permit(:date, :vendor, :who, :what, :where, :why, :string, :amount, :precision, :program_id, :account_id)
    end
end
