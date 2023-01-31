class Api::V1::UserBikesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def user_have_bikes
    user_bikes = current_user.my_bikes
    render json: user_bikes
  end

  def create
    if current_user 
      current_user.user_bikes.create!(user_bike_params)
      user_bikes = current_user.my_bikes
      render json: user_bikes
    else
      render json: { message: '保存できませんでした' }
    end
  end

  def destroy
    if current_user 
      user_bike = UserBike.find_by(user_id: current_user.id, bike_id: params[:bike_id])
      user_bike.destroy!
    else
      render json: { message: '削除に失敗しました' }
    end
  end

  private

  def user_bike_params
    params.require(:user_bike).permit(:bike_id)
  end

end
