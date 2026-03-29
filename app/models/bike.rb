class Bike < ApplicationRecord

  validates :name, presence: true 
  
  belongs_to :manufacturer
  belongs_to :illustration
  has_many   :user_bikes
end
