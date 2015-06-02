class RemoveWhenFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :when, :string
  end
end
