require 'rails_helper'

 RSpec.describe 'User Story 2' do
   describe 'parent show page' do
     it "can see a winemaker with all its attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers/#{winemaker1.id}"

       expect(page).to have_content(winemaker1.name)
       expect(page).to_not have_content(winemaker2.name)
       expect(page).to have_content(winemaker1.region)
       expect(page).to_not have_content(winemaker2.region)
       expect(page).to have_content(winemaker1.vineyard_acreage)
       expect(page).to_not have_content(winemaker2.vineyard_acreage)
       expect(page).to have_content(winemaker1.public_tasting)
       expect(page).to_not have_content(winemaker2.public_tasting)
     end
   end
 end
