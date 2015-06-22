class Transaction < ActiveRecord::Base
  validates :amount, presence: true, numericality: true  
  belongs_to :user  
    
# def total
#    t = Transaction.all
#    amounts = t.pluck(:amounts)
#    amounts.sum
#  end

end
