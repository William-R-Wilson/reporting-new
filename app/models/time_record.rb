class TimeRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :pay_period
  before_validation :default_values
  validates_presence_of :user_id
  validates_numericality_of :hours, :sick, :vacation
  
  self.per_page = 12
  
  def default_values
    self.vacation ||= 0
    self.sick ||= 0
    self.hours ||= 80
  end
  
  def total 
    self.hours_total = hours + sick + vacation
  end
  
end
