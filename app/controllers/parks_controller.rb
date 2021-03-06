class ParksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @parks = Park.all
    @overall_parks = Park.sorted_by_overall_average[0..2]
    @energy_parks = Park.sorted_by_energy_level_average[0..2]
    @facilities_parks = Park.sorted_by_facilities_average[0..2]
    @scene_parks = Park.sorted_by_scene_average[0..2]
  end

   def new
     @park = Park.new
   end

  def create
    @park = Park.new(park_params)
    if @park.save
      flash[:success] = "Ruff!"
      redirect_to parks_path
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
    @review = @park.reviews.build if logged_in?
    @reviews = @park.reviews.limit(5)
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    flash[:success] = "Ruff"
    redirect_to request.referrer
  end

  private

  def park_params
    params.require(:park).permit(:name, :address, :description, :latitude, :longitude)
  end


end
