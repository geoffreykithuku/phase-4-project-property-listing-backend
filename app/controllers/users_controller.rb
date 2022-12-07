class UsersController < ApplicationController

            rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
            #GET /users
           def index 
            users = User.all 
            render json: users ,status: :ok
           end 
        
        
        
           #GET /users/:id
           def show
           user = get_user
           if user
            render json: user,status: :found
           else
            render json: {error:"User Not Found"}
           end 
        end 
            
        
           #POST /user
           def  create
           user = Property.create!(user_params)
           if user
            render json: user ,status: :created
           end
           end 
        
        
           #PATCH /users/:id
           def update
           user = get_user
           user.update!(user_params)
            render json: user,status: :accepted
           end 
        
        #DELETE /users/:id
           def destroy  
            user = get_user
            if user
             user.destroy
             head :no_content
            else
             render json: {error:"User not found"},status: :not_found
            end
           end 
        
           private

           def get_user
           a_user = User.find_by(id: params[:id])
           a_user
           end 
          
            def user_params
            params.permit(:username,:email)
            end
        
           def render_unprocessable_entity_response(invalid)
            render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 
           end
        
end