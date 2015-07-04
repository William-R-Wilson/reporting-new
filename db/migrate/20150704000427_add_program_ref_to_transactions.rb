class AddProgramRefToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :program, index: true
  end
end
