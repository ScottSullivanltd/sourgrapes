require 'rails_helper'

 RSpec.describe 'Winemaker Index page' do

   describe 'User Story 1, Winemaker Index', type: :feature do
     it "can see all winemaker names" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       expect(page).to have_content(winemaker1.name)
       expect(page).to have_content(winemaker2.name)
     end
   end

   describe 'User Story 6, Winemaker Index sorted by Most Recently Created', type: :feature do
     it "can see winemakers ordered by most recent and when it was created" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       expect(page).to have_content("#{winemaker2.name} #{winemaker2.formatted_date}")
       expect(page).to have_content("#{winemaker1.name} #{winemaker1.formatted_date}")
     end
   end

   describe 'User Story 8, Wine Index Link', type: :feature do
     it "links to the Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       click_on "All Wines"

       expect(current_path).to eq("/wines")
     end
   end

   describe 'User Story 9, Winemaker Index Link', type: :feature do
     it "links to the Winemaker Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers"

       click_on "All Winemakers"

       expect(current_path).to eq("/winemakers")
     end
   end
 end
