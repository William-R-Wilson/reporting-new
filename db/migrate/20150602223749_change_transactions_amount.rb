class ChangeTransactionsAmount < ActiveRecord::Migration
  def change
    change_column :transactions, :amount, :decimal, precision:6, scale:2
  end
end
