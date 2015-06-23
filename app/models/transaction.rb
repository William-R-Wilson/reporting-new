class Transaction < ActiveRecord::Base
  validates :amount, presence: true, numericality: true  
  belongs_to :user  
    

end
