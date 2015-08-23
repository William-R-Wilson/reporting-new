class FixPercentTime < ActiveRecord::Migration
  def change
    rename_column :users, :percentTime, :percent_time
  end
end
