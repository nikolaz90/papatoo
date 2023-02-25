class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :get_coordinates_from_address]
  def index
    policy_scope(Location)
    @location = Location.new
    @locations = Location.current_and_future_locations.includes(:user)
    @markers = @locations.geocoded.map do |item|
      {
        long: item.long,
        lat: item.lat,
        marker_on_location_html: render_to_string(partial: 'marker_on_location', locals: { location: item }),
        details_on_location_html: render_to_string(partial: 'details_on_location', locals: { location: item })
      }
    end
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    authorize @location
    redirect_to locations_path if @location.save
  end

  def get_coordinates_from_address
    authorize Location
    render json: Geocoder.search(params[:address]).first.coordinates
  end

  def destroy
    @location = Location.find(params[:id])
    authorize @location
    @location.destroy
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:long, :lat, :description, :start_time, :duration)
  end
end
