require 'rails_helper'

 RSpec.describe 'User Story 2' do
   describe 'parent show page' do
     it "can see a winemaker with id and all attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers/#{winemaker1.id}"

       expect(page).to have_content(winemaker1.name)
       expect(page).to_not have_content(winemaker2.name)
     end
   end
 end