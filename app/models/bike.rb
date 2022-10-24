class Bike < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :illustration
  has_many   :user_bikes
end
