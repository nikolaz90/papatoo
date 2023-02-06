class LocationsController < ApplicationController
  def index
    policy_scope(Location)
    @locations = Location.all
    @markers = @locations.geocoded.map do |item|
      {
        long: item.long,
        lat: item.lat
      }
    end
  end
end
