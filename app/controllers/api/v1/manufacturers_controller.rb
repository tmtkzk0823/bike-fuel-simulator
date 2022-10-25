module Api
  module V1
    class ManufacturersController < ApplicationController
      def index
        manufacturers = Manufacturer.all

        render json:{
        manufacturers: manufacturers
      }, status: :ok
      end
    end
  end
end
