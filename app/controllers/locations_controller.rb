class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    policy_scope(Location)
    @location = Location.new
    @locations = Location.all.includes(:user)
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
    @location = Location.new
    authorize @location

    raise
    if @location.save
    else
    end
  end
end
