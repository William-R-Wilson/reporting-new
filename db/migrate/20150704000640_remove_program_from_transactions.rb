class RemoveProgramFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :program, :string
  end
end
