class PayPeriod < ActiveRecord::Base
  has_many :time_records
end
