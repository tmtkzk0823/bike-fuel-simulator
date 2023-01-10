class UserBike < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :user_id, uniqueness: {scope: :post_id}
end
