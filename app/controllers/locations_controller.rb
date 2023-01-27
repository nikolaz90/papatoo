class LocationsController < ApplicationController
  def index
    policy_scope(Location)
  end
end
