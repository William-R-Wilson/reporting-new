class ChangeNameToFirstName < ActiveRecord::Migration
  rename_column :users, :firstname, :first_name
end
