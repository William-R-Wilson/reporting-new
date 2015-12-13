class ChangeNameToFirstName < ActiveRecord::Migration
  rename_column :users, :name, :first_name
end
