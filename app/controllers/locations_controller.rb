class LocationsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)

    if @location.valid?
      @location.save
      session[:location_id] = @location.id
      redirect_to location_path(@location)
    else
      flash[:error] = @location.errors.full_messages
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      flash[:error] = @location.errors.full_messages
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name, :capacity)
  end
end
