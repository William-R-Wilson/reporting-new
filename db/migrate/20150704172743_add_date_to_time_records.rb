class AddDateToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :date, :date
  end
end
