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


def edit
  @review = Review.find(params[:id])
  @park = @review.park
end

def update
  @review = Review.find(params[:id])
  @park = @review.park
  if @review.update_attributes(review_params)
    flash[:success] = "Ruff"
    redirect_to @park
  else
    render 'edit'
  end
end

def destroy
  @review = Review.find(params[:id])
  @park = @review.park
  @review.destroy
  flash[:success] = "Bark retracted upon further reflection"
  redirect_to @park
end



private

def review_params
  params.require(:review).permit(:overall, :energy_level, :facilities, :scene, :content, :park_id, :user_id)
end



end
