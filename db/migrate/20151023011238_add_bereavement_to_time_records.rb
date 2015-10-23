class AddBereavementToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :bereavement, :integer
  end
end
