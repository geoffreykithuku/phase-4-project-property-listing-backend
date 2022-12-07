class PropertiesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /properties
   def index 
    properties = Property.all 

    render json: properties ,status: :ok
   end #END index



   #GET /properties/:id
   def show
   property = get_property

   if property

    render json: property,status: :found

   else

    render json: {error:"Property Not Found"}

   end #END if

   end #END show
    

   #POST /properties
   def  create

   property = Property.create!(property_params)

   if property 
    render json: property ,status: :created
   end

   end #END create

   private
   #Get a property with given id
   def get_property

   a_property = Property.find_by(id: params[:id])

   a_property

   end #END get_property
  

   #Define allowable parameters for mass assignment
    def property_params

    params.permit(:owner_id,:location,:description,:price,:image)

    end #END property_params


    #Handle exception and rescue with RecordInvalid
   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end #END  handle exception

end #END properties_controller
