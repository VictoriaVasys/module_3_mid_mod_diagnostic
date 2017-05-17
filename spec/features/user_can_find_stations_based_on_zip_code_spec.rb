require 'rails_helper'

feature 'User sees electric & propane stations within 6 miles of zip code' do
  xscenario 'User is navigated to correct page and sees station information' do
    visit root_path
    fill_in "search-box", with: "80203"
    click_on "Locate"
    
    expect(current_path).to eq search_path # Then I should be on page "/search" with parameters visible in the url
    within('div.station_0') {expect(page).to have_content "Station: UDR"}
    within('div.station_0') {expect(page).to have_content "Address: 800 Acoma St, Denver, CO 80204"}
    within('div.station_0') {expect(page).to have_content "Fuel Type: Electric"}
    within('div.station_0') {expect(page).to have_content "Distance: 0.314 miles"}
    within('div.station_0') {expect(page).to have_content "Access Times: 24 hours daily"}
  end
end