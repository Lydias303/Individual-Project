class LocationController < ApplicationController

  def create
    Location.create!(params[:location])
  end
end
