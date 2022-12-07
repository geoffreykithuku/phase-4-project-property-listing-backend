class ReviewsController < ApplicationControllers
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        #GET /reviews
        def index
       reviews= Review.all
    
       render json: reviews ,status: :ok
    
        end #END index
    
    #GET /reviews/:id
        def show
    
        review = find_review
        if review
        render json: review,status: :found
    
        else
            render json: {error:"Review not found"}, status: :not_found
        end
    
        end #END show
    
    #POST /reviews
       def create 
        review =Review.create!(review_params)
    
        if review
            render json: review ,status: :created
        end
    
       end #END create
    
    
    #DEFINE private methods
       private
      #Restrict owner params to username and email
      def review_params
    
        params.permit(:property_id,:user_id,:description)
    
      end #END owner_params
    
       #Handle exception and rescue with RecordInvalid
       def render_unprocessable_entity_response(invalid)
    
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity 
    
       end #END  handle exception
    
    #Find review by id
    def find_review
    
    a_review = Review.find_by(id: params[:id])
    
    a_review   
    end #END find_owner
    
end
