class Transaction < ActiveRecord::Base
  validates :amount, presence: true, numericality: true  
  validates :vendor, :what, presence: true
  belongs_to :user  
  
  self.per_page = 15
    

end
