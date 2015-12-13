class RemoveStringFromTransactions < ActiveRecord::Migration
  change_table :transactions do |t|
    t.remove :string
  end
end
