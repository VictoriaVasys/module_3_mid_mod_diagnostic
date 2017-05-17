class SearchController < ApplicationController
  
  def index
    @zip = params['q']
    
    @stations = (JSON.parse(response.body, symbolize_names: true))[:fuel_stations]
  end
  
end