class PropertiesController < ApplicationController
    def index
        property = Property.all 
        render json: property, status: :ok
    end
   
end
