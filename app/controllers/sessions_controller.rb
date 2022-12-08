class SessionsController < ApplicationController 
 wrap_parameters format: []

     def create   
            owner = Owner.find_by(email: params[:email])

            if owner && owner.authenticate(params[:password])
                session[:user_id] = owner.id
                render json: owner, status: :created
            else
            owner = Owner.new
                owner.validate
                render json: {errors: owner.errors.full_messages}, status: :unauthorized
            end
      end 
      def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

        def destroy

            owner = Owner.find_by(id: session[:user_id])

            if owner
                session.delete :user_id
                head :no_content
            else
                owner = Owner.new 
                owner.validate
                render json: {errors: owner.errors.full_messages}, status: :unauthorized
            end
        end
  
end