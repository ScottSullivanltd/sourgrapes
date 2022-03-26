require 'rails_helper'

 RSpec.describe 'User Story 1' do
   describe 'winemakers index page', type: :feature do
     it "can see all winemaker names" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       expect(page).to have_content(winemaker1.name)
       # expect(page).to have_content("Region: #{winemaker1.region}")
       expect(page).to have_content(winemaker2.name)
       # expect(page).to have_content("Region: #{winemaker2.region}")
     end
   end
 end
