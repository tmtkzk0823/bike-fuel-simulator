class Api::V1::UserBikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if current_user 
      current_user.user_bikes.create!(user_bike_paramas)
      user_bikes = UserBike.where(user_id: current_user.id)
      render json: user_bikes
    end

  def destroy
    user_bike = UserBike.find(params[:id])
    user_bike.destroy
    render json: user_bike

  end

  private

  def user_bike_paramas
    params.require(:user_bike).permit(:bike_id)
  end
end
