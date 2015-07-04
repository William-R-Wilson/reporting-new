class RemoveAccountFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :account, :string
  end
end
