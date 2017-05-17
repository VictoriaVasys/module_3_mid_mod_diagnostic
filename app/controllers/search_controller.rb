class SearchController < ApplicationController
  
  def index
    @zip = params['q']
    conn = Faraday.new("https://developer.nrel.gov")
    response = conn.get do |req|
      req.url '/api/alt-fuel-stations/v1/nearest.json'
      req.params['location'] = zip
      req.params['radius'] = 6.0
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['limit'] = 10
      req.params['api_key'] = ENV['NREL_KEY']
    end
    @stations = JSON.parse(response.body)
  end
  
end