class User < ApplicationRecord
# Include default devise modules.
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :visited_places, dependent: :destroy
  has_many :user_bikes, dependent: :destroy
end
