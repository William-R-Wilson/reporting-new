class Transaction < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, message: "must be a number"
  validates :vendor, :what, presence: true
  validates_presence_of :who, message: "can't be blank.  You can enter your own name"
  belongs_to :user
  belongs_to :account
  belongs_to :program

  self.per_page = 20

  def self.to_csv
    attributes = %w{employee date vendor who what where why amount account program}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |transaction|
        csv << [transaction.user.first_name,
                transaction.date,
                transaction.vendor,
                transaction.who,
                transaction.what,
                transaction.where,
                transaction.why,
                transaction.amount,
                transaction.account.name,
                transaction.program.name]
      end
    end

  end




end
