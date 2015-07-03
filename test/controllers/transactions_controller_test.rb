require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  setup do
    @transaction = transactions(:one)
    @user = users(:one)
    login_as(@user)
  end


  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: { 
        account: @transaction.account, 
        amount: @transaction.amount, 
        date: @transaction.date, 
        program: @transaction.program, 
        vendor: @transaction.vendor, 
        what: @transaction.what, 
        where: @transaction.where, 
        who: @transaction.who, 
        why: @transaction.why,
        user_id: @transaction.user_id
        }
    end

    assert_redirected_to transactions_path
  end


  test "should get edit" do
    get :edit, id: @transaction
    assert_response :success
  end

  test "should update transaction" do
    patch :update, id: @transaction, transaction: { account: @transaction.account, amount: @transaction.amount, date: @transaction.date, program: @transaction.program, vendor: @transaction.vendor, what: @transaction.what, where: @transaction.where, who: @transaction.who, why: @transaction.why }
    assert_redirected_to transactions_path
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete :destroy, id: @transaction
    end

    assert_redirected_to transactions_path
  end
end
