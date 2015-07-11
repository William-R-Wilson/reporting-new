class AddSplitsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :splits, :string
  end
end
