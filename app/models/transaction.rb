class Transaction < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, message: "must be a number"  
  validates :vendor, :what, presence: true
  validates_presence_of :who, message: "can't be blank.  You can enter your own name"
  belongs_to :user  
  
  self.per_page = 12
    

end
