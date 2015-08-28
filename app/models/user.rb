

class User < ActiveRecord::Base
  require 'date'
  before_save { self.email = email.downcase }
  after_initialize :init
  #before_save :calculate_vacation
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :transactions
  has_many :time_records
  has_secure_password
  validates :password, presence: true, on: :create, length: { minimum: 8 }
  after_destroy :ensure_an_admin_remains
  attr_accessor :remember_token

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token) )
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def calculate_vacation
    today = Date.today
    start = self.start_date
    num_months = calculate_months(today, start)
    timerecords = TimeRecord.where("user_id = ?", self.id)
    vacation_used = timerecords.sum(:vacation)
    self.accrued_vacation = self.starting_vacation + (num_months*16) - vacation_used
  end


  private

    def calculate_months(today, pastDate)
      (today.year * 12 + today.month) - (pastDate.year * 12 + pastDate.month)
    end



    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

    def init
      self.percent_time ||= 1
      #self.accrued_vacation ||= 0
    end


end
