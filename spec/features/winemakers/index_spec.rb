require 'rails_helper'

 RSpec.describe 'winemaker features index' do
   describe 'User story 1', type: :feature do
     it "can see all winemaker names" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       expect(page).to have_content(winemaker1.name)
       expect(page).to have_content(winemaker2.name)
     end
   end

   describe 'User story 6', type: :feature do
     it "can see winemakers ordered by most recent and when it was created" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       expect(page).to have_content("#{winemaker2.name} #{winemaker2.formatted_date}")
       expect(page).to have_content("#{winemaker1.name} #{winemaker1.formatted_date}")
     end
   end
 end
