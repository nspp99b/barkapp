class ReviewsController < ApplicationController

def create
   @review = current_user.reviews.build(review_params)
   if @review.save
     flash[:success] = "Ruff!"
     redirect_to request.referrer
   else
     redirect_to request.referrer
  end
end

private

def review_params
  params.require(:review).permit(:overall, :energy_level, :facilities, :scene, :content, :park_id, :user_id)
end



end
