class User < ApplicationRecord
  has_many :user_bikes, dependent: :destroy
  has_many :visited_places, dependent: :destroy
end
