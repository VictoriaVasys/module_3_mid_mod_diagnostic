describe NRELService do
  
  scenario "finds stations" do
    VCR.use_cassette("nrel_stations_based_on_zip") do
      stations = NRELService.new(80203).find_stations_based_on_zip
      
      expect(stations).to be_an(Array)
      expect(stations.first).to have_key(:station_name)
    end
  end
end