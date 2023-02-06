class LocationsController < ApplicationController
  def index
    policy_scope(Location)
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
end
