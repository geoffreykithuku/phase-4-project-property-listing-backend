class OwnersController < ApplicationController
    #GET /owners
    def index
   owners = Owner.all

   render json: owners ,status: :ok

    end
end
