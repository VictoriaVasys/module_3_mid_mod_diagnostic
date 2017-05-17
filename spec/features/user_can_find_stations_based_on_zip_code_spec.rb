require 'rails_helper'

feature 'User sees electric & propane stations within 6 miles of zip code' do
  scenario 'User is navigated to correct page' do
    visit root_path
    fill_in "Search by zip...", with: "80203"
    click_on "Locate"
    
    expect(current_path).to eq search_path
  end
  
  scenario 'User sees station information' do
    visit sear
  end
end