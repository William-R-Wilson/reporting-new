class AddStartingSickToUsers < ActiveRecord::Migration
  def change
    add_column :users, :starting_sick, :decimal
  end
end
