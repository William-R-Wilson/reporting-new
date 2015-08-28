class AddStartingVacationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :starting_vacation, :decimal
  end
end
