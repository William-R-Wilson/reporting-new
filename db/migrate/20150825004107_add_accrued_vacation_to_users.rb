class AddAccruedVacationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accrued_vacation, :decimal, precision:6, scale:2
  end
end
