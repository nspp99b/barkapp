class ParksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @parks = Park.all.limit(30)
  end

   def new
     @park = Park.new
   end


  def create
    @park = Park.new(park_params)
    if @park.save
      flash[:success] = "Ruff!"
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])  
    if @park.update_attributes(park_params)
      flash[:success] = "Ruff"
      redirect_to @park
    else
      render 'edit'
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    flash[:success] = "Ruff"
    redirect_to @parks
  end

  private

  def park_params
    params.require(:park).permit(:name, :address, :description, :latitude, :longitude)
  end


end
