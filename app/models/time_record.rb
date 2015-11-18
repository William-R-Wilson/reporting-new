class TimeRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :pay_period
  after_initialize :default_values
  validates_presence_of :user_id
  validates_numericality_of :hours, :sick, :vacation
  before_save :total_hours

  self.per_page = 12

  def default_values
    self.vacation ||= 0
    self.sick ||= 0
    self.hours ||= 80
    self.holiday ||= 0
    self.bereavement ||= 0
    self.jury_duty ||= 0
    self.inclement_weather ||= 0
  end

  def total_hours
    hours_total = hours + sick + vacation
  end

end
