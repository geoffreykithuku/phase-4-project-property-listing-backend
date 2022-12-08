class PropertiesController < ApplicationController

before_action :authorize
skip_before_action :authorize, only: [:index]
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

        #GET /properties
       def index 
        properties = Property.all 
        render json: properties ,status: :ok
       end
    
    
    
       #GET /properties/:id
       def show
       property = get_property
       if property
        render json: property,status: :found
       else
        render json: {error:"Property Not Found"}
       end
       end 
        
    
       #POST /properties
       def  create
       property = Property.new(property_params)
         property.owner_id = session[:user_id]
         property.save!
       if property 
       
        render json: property ,status: :created
       end
       end 
    
    
       #PATCH /properties/:id
       def update
        property = get_property
        property.update!(property_params)
        render json: property,status: :accepted
       end
    
    #DELETE /properties/:id
       def destroy  
        property = get_property
        if property
            property.destroy
            head :no_content
        else
            render json: {error:"Property not found"},status: :not_found
        end
       end
    
       private
       def authorize 
        render json: {error: "Unauthorized! Login to view this page."}, status: :unauthorized unless session.include? :user_id
       end

       def get_property
       a_property = Property.find_by(id: params[:id])
       a_property
       end 
      
        def property_params
        params.permit(:location,:description,:price,:image)
        end 

       def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 
       end 
end
