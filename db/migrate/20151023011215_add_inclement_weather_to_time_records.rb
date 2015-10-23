class AddInclementWeatherToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :inclement_weather, :integer
  end
end
