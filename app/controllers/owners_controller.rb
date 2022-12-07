class OwnersController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    #GET /owners
    def index
   owners = Owner.all
   render json: owners ,status: :ok
   end 

    #GET /owners/:id
    def show

    owner = find_owner
    render json: owner,status: :found
    end

    #POST /owners
   def create 
    owner =Owner.create!(owner_params)
    render json: owner ,status: :created
   end

    #PATCH /owners/:id
    def update
    owner =find_owner
    owner.update!(owner_params)
    render json: owner,status: :accepted
    end 

   #DELETE owners/:id
   def destroy
    owner =find_owner
    owner.destroy
    head :no_content
   end


   private

    def owner_params
       params.permit(:email,:username)
    end 

   def render_unprocessable_entity_response(invalid)

    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 

   end 

  def find_owner

  an_owner = Owner.find_by(id: params[:id])

    an_owner 
  end 

def record_not_found_method
    render json: {error: "Restaurant not found"}, status: :not_found
end

end
