class BarksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @barks = Bark.all.limit(30)
  end

  def create
    @bark = current_user.barks.build(bark_params)
    if @bark.save
      flash[:success] = "Ruff!"
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def edit
    @bark = Bark.find(params[:id])
  end

  def update
    @bark = Bark.find(params[:id])
    @user = @bark.user
    if @bark.update_attributes(bark_params)
      flash[:success] = "Ruff"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @bark = Bark.find(params[:id])
    @user = @bark.user
    @bark.destroy
    flash[:success] = "Bark retracted upon further reflection"
    redirect_to @user
  end

  private

  def bark_params
    params.require(:bark).permit(:content)
  end

end
