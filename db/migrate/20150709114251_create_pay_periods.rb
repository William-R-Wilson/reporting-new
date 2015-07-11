class CreatePayPeriods < ActiveRecord::Migration
  def change
    create_table :pay_periods do |t|
      t.date :date

      t.timestamps
    end
  end
end
