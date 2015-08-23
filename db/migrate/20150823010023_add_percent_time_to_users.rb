class AddPercentTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :percentTime, :decimal
  end
end
