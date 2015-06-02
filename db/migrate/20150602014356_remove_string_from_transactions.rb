class RemoveStringFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :string, :string
  end
end
