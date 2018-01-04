class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @user = current_user.id
    @bark = params[:bark_id]
    @like = Like.new(user_id: @user, bark_id: @bark)
    if @like.save
      redirect_to request.referrer
    else
      flash[:danger] = "ROOF!"
      redirect_to request.referrer
    end
  end

  def destroy
  end

end
