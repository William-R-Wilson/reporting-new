class TimeRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :pay_period
  after_initialize :default_values
  validates_presence_of :user_id
  validates_numericality_of :hours, :sick, :vacation
  before_save :total_hours

  self.per_page = 12

  def self.to_csv
    attributes = %w{employee date hours vacation sick jury inclement holiday bereavement}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |record|
        csv << ["#{record.user.first_name}" + " #{record.user.last_name}",
                record.date,
                record.hours,
                record.vacation,
                record.jury_duty,
                record.inclement_weather,
                record.holiday,
                record.bereavement]
      end
    end
  end

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
