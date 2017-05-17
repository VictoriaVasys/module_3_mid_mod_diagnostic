class SearchController < ApplicationController
  
  def index
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
    response = 
    @stations = 
  end
  
end