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

  def destroy
  end

  def index
    @accounts = Account.all
  end
  
  private 
  
    def account_params
      params.require(:account).permit(:name)
    end
end
