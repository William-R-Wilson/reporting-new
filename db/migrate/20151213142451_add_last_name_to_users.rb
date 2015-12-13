class AddLastNameToUsers < ActiveRecord::Migration
  add_column :users, :last_name, :string
end
