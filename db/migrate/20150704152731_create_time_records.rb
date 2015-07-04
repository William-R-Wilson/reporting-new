class CreateTimeRecords < ActiveRecord::Migration
  def change
    create_table :time_records do |t|
      t.integer :hours
      t.integer :vacation
      t.integer :sick

      t.timestamps
    end
  end
end
