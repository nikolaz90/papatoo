class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
  end

  def my_index
  end

  def new
  end
end
