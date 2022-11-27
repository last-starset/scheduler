class LocationsController < ApplicationController
    def show 
        @location = Location.find(params[:id])
    def index
        @locations = Location.all
end
