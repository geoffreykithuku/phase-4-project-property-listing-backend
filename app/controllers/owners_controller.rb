class OwnersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /owners
    def index
   owners = Owner.all

   render json: owners ,status: :ok

    end #END index

#GET /owners/:id
    def show

    owner = find_owner
    if owner
    render json: owner,status: :found

    else
        
    end

    end #END show

#POST /owners
   def create 
    owner =Owner.create!(owner_params)

    if owner
        render json: owner ,status: :created
    end

   end #END create

#PATCH /owners/:id
def update
 owner =find_owner

 owner.update!(owner_params)

 render json: owner,status: :accepted
 
end #END update



#DELETE owners/:id
def destroy
    owner =find_owner

    owner.destroy
    head :no_content
end #END destroy






#DEFINE private methods
   private
  #Restrict owner params to username and email
  def owner_params

    params.permit(:email,:name, :password, :password_confirmation)

  end #END owner_params

   #Handle exception and rescue with RecordInvalid
   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end #END  handle exception

#Find owner by id
def find_owner

an_owner = Owner.find_by(id: params[:id])

an_owner    
end #END find_owner





end #END owners_controller
