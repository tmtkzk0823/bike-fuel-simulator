class User < ApplicationRecord
# Include default devise modules.
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :visited_places, dependent: :destroy
  has_many :user_bikes, dependent: :destroy
  has_many :my_bikes, through: :user_bikes, source: :bike


  # deviseでのupdateメソッドでpasswordをを不要とする処理
  def update_without_current_password(params, *options) # * => 可変調引数
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def my_bike(bike)
    my_bikes << bike
  end

  def unmy_bike(bike)
    my_bike.delete(bike)
  end
end
