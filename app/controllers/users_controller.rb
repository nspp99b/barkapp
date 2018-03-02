class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

  def index
    @users = User.all
		@bark = current_user.barks.build if logged_in?
		@top_barkers = User.sorted_by_number_of_barks[0..2]
		@top_reviewers = User.sorted_by_number_of_reviews[0..2]
		@newest_pups = User.sorted_by_creation[0..2]
		@created_last_day = User.created_last_day
		@created_last_week = User.created_last_week
		@created_last_month = User.created_last_month
		@created_last_year = User.created_last_year
		@average_bark_length = Bark.average_length
		@average_review_length = Review.average_length
		@average_number_of_reviews = User.average_number_of_reviews
		@average_number_of_likes = User.average_number_of_likes
		@average_number_of_barks = User.average_number_of_barks
		@median_number_of_reviews = User.median_number_of_reviews
		@median_number_of_likes = User.median_number_of_likes
		@median_number_of_barks = User.median_number_of_barks
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Bark!  Ruff!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
		@bark = current_user.barks.build if logged_in?
		@barks = @user.barks.limit(5)
		@reviews = @user.reviews.limit(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Ruff!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

   # Before filters

# Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
