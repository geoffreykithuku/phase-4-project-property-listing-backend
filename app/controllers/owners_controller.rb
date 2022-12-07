class OwnersController < ApplicationController
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
end
