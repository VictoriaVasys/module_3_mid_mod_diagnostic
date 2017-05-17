class SearchController < ApplicationController
  
  def index
    zip = params['q']
    @stations = NRELService.new(zip).find_stations_based_on_zip
  end
  
end