class AccountsController < ApplicationController
  before_action :check_if_admin, :authorize
  
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_url, notice: 'Account was successfully added.' }
        format.json { redirect_to accounts_url, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_url, notice: 'Account was successfully edited.' }
        format.json { redirect_to accounts_url, status: :ok, location: @accounts }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
        format.html { redirect_to accounts_url, notice: "Account was successfully deleted." }
        format.json { head :no_content }
    end
  end

  def index
    @accounts = Account.all
  end
  
  private 
  
    def account_params
      params.require(:account).permit(:name, :id)
    end
end
