class NRELService
  def initialize
      @_nrel_key = {api_key: ENV['NREL_KEY']}
      @_conn = Faraday.new("https://developer.nrel.gov")
    end
  
    def find_stations_based_on_zip
      response = conn.get do |req|
        req.url '/api/alt-fuel-stations/v1/nearest.json'
        req.params['location'] = @zip
        req.params['radius'] = 6.0
        req.params['fuel_type'] = 'LPG,ELEC'
        req.params['limit'] = 10
        req.params['api_key'] = ENV['NREL_KEY']
      end
      parser(conn.get("/user", token_param))
    end
    
  private
  
  attr_reader :_nrel_key, :_conn
    alias_method :nrel_key, :_nrel_key
    alias_method :conn, :_conn
    
    def parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end