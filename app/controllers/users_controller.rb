class UsersController < ApplicationController
    class PropertiesController < ApplicationController
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        #GET /users
       def index 
        users = User.all 
    
        render json: users ,status: :ok
       end #END index
    
    
    
       #GET /users/:id
       def show
       user = get_user
    
       if user
    
        render json: user,status: :found
    
       else
    
        render json: {error:"User Not Found"}
    
       end #END if
    
       end #END show
        
    
       #POST /user
       def  create
    
       user = Property.create!(user_params)
    
       if user
        render json: user ,status: :created
       end
    
       end #END create
    
    
       #PATCH /users/:id
       def update
    
       user = get_user
    
       user.update!(user_params)
    
        render json: user,status: :accepted
    
       end #END update
    
    #DELETE /users/:id
       def destroy  
        user = get_user
    
        if user
         user.destroy
         head :no_content
        else
         render json: {error:"User not found"},status: :not_found
        end
    
       end #END destroy
    
       private
    #Get a user with given id
       def get_user
    
       a_user = User.find_by(id: params[:id])
    
       a_user
    
       end #END get_user
      
    
    #Define allowable parameters for mass assignment
        def user_params
    
        params.permit(:username,:email)
    
        end #END user_params
    
    
    #Handle exception and rescue with RecordInvalid
       def render_unprocessable_entity_response(invalid)
    
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 
    
       end #END  handle exception
    
    end #END properties_controller
    
end
