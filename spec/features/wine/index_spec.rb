require 'rails_helper'

 RSpec.describe 'User Story 3' do
   describe 'wines index page', type: :feature do
     it "can see all wines and attributes" do
       wine1 = Wine.create!(name: "Cabernet", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine2 = Wine.create!(name: "Merlot", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/wines"

       expect(page).to have_content(winemaker1.name)
       expect(page).to have_content("Region: #{winemaker1.region}")
       expect(page).to have_content(winemaker2.name)
       expect(page).to have_content("Region: #{winemaker2.region}")
     end
   end
 end
