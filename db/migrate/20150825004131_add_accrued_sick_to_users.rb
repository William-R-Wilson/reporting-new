class AddAccruedSickToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accrued_sick, :decimal, precision:6, scale:2

  end
end
