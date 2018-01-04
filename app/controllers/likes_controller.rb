class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @like = Like.new(user_id: params[:user_id], bark_id: params[:bark_id])
    if @like.save
      redirect_to request.referrer
    else
      flash[:danger] = "ROOF!"
      redirect_to request.referrer
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:success] = "Ruff"
    redirect_to request.referrer
  end

end
