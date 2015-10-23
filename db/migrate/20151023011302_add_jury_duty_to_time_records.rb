class AddJuryDutyToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :jury_duty, :integer
  end
end
