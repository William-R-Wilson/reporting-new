class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :vendor
      t.string :who
      t.string :what
      t.string :where
      t.string :why
      t.string :string
      t.decimal :amount, precision: 2
      t.string :program
      t.string :account

      t.timestamps
    end
  end
end
