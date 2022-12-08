class PropertiesController < ApplicationController

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
       property = Property.create!(property_params)
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

       def get_property
       a_property = Property.find_by(id: params[:id])
       a_property
       end 
      
        def property_params
        params.permit(:owner_id,:location,:description,:price,:image)
        end 

       def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 
       end 
end
