require 'rails_helper'

 RSpec.describe 'Winemaker Show page' do

   describe 'User Story 2, Winemaker Show', type: :feature do
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

   describe 'User Story 7, Winemaker Wine Count', type: :feature do
     it "can see a count of the number of wines associated with a winemaker" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)
       wine2 = winemaker1.wines.create!(name: "Pinotrest", blend: "Pino Noir", vintage: "2010", barrels_produced: 104, signature_label: false)

       visit "/winemakers/#{winemaker1.id}"

       expect(page).to have_content("Total number of Mondovete wines: 3")
     end
   end

   describe 'User Story 8, Wine Index Link', type: :feature do
     it "links to the Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers/#{winemaker1.id}"

       click_on "All Wines"

       expect(current_path).to eq("/wines")
     end
   end

   describe 'User Story 9, Winemaker Index Link', type: :feature do
     it "links to the Winemaker Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)

       visit "/winemakers/#{winemaker1.id}"

       click_on "All Winemakers"

       expect(current_path).to eq("/winemakers")
     end
   end

   describe 'User Story 10, Winemaker Wine Index Link', type: :feature do
     it "links to the Winemaker Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)
       wine3 = winemaker1.wines.create!(name: "Pinotrest", blend: "Pino Noir", vintage: "2010", barrels_produced: 104, signature_label: false)

       visit "/winemakers/#{winemaker1.id}"

       click_on "See Our Wines"

       expect(current_path).to eq("/winemakers/#{winemaker1.id}/wines")
     end
   end
 end
