class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :games]

  def home
  end

  def games
  end
end
