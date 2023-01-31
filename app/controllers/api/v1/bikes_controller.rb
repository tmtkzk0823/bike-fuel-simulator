module Api
  module V1
    class BikesController < ApplicationController
      def index
        bike_manufacturer = Manufacturer.find(params[:manufacturer_id])
    
        bike_lists_displacement_0_50 = bike_manufacturer.bikes.where(displacement: 0..50)
        bike_lists_displacement_51_125 = bike_manufacturer.bikes.where(displacement: 51..125)
        bike_lists_displacement_126_250 = bike_manufacturer.bikes.where(displacement: 126..250)
        bike_lists_displacement_251_400 = bike_manufacturer.bikes.where(displacement: 251..400)
        bike_lists_displacement_401_750 = bike_manufacturer.bikes.where(displacement: 401..750)
        bike_lists_displacement_over750 = bike_manufacturer.bikes.where(displacement: 751..Float::INFINITY)
    
        render json:{
          bike_lists_displacement_0_50: bike_lists_displacement_0_50,
          bike_lists_displacement_51_125: bike_lists_displacement_51_125,
          bike_lists_displacement_126_250: bike_lists_displacement_126_250,
          bike_lists_displacement_251_400: bike_lists_displacement_251_400,
          bike_lists_displacement_401_750: bike_lists_displacement_401_750,
          bike_lists_displacement_over750: bike_lists_displacement_over750,
        },status: :ok
    
      end
    end
  end
end

