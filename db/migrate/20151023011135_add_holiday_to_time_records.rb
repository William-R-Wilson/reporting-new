class AddHolidayToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :holiday, :integer
  end
end
