class PropertiesController < ApplicationController
    def index
        property = Property.all 
        render json: property, status: :ok
    end
   def create 
    property = Property.create(property_params)
    if property 
        render json: property, status: :created 
    else
        render json: {error: "Failed"}, status: :unprocessable_entity 
    end
   end



   private 
   def property_params 
    params.permit(:image, :description, :price, :location)
   end
end
