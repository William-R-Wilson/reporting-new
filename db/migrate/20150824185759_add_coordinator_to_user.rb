class AddCoordinatorToUser < ActiveRecord::Migration
  def change
    add_column :users, :coordinator, :boolean, default: false
  end
end
