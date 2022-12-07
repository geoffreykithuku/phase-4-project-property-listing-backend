class OwnersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    #GET /owners
    def index
   owners = Owner.all

   render json: owners ,status: :ok

    end

#GET /owners/:id
    def show

    owner = Owner.find_by(id: params[:id])

    if owner
        render json: owner,status: :found
    else
        render json: {error:"Owner not found"} ,status: :not_found
    end

    end

#POST /owners
   def create 
    owner =Owner.create!(owner_params)

    if owner
        render json: owner ,status: :created
    end
    
   end

#PATCH /owners/:id
def update
 owner =find_owner

 owner.update(owner_params)
 
end

   private
  #Restrict owner params to username and email
  def owner_params

    params.permit(:email,:username)

  end

   #Handle exception and rescue with RecordInvalid
   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.errors.full_messages},status: :unprocessable_entity 

   end

#Find owner by id
def find_owner

owner = Owner.find_by(id: params[:id])

if !owner

    render json: {error: "Owner not found"},status: :not_found
else
    owner
end

end


end
