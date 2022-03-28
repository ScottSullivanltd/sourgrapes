require 'rails_helper'

 RSpec.describe 'Winemaker Wine Index page' do

   describe 'User Story 5, Winemaker Wine Index', type: :feature do
     it "can see all wines for the winemaker" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/winemakers/#{winemaker1.id}/wines"

       expect(page).to have_content(wine1.name)
       expect(page).to have_content(wine1.blend)
       expect(page).to have_content(wine1.vintage)
       expect(page).to have_content(wine1.barrels_produced)
       expect(page).to have_content(wine1.signature_label)
       expect(page).to have_content(wine2.name)
       expect(page).to have_content(wine2.blend)
       expect(page).to have_content(wine2.vintage)
       expect(page).to have_content(wine2.barrels_produced)
       expect(page).to have_content(wine2.signature_label)
     end
   end

   describe 'User Story 8, Wine Index Link', type: :feature do
     it "links to the Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/winemakers/#{winemaker1.id}/wines"

       click_on "All Wines"

       expect(current_path).to eq("/wines")
     end
   end

   describe 'User Story 9, Winemaker Index Link', type: :feature do
     it "links to the Winemaker Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/winemakers/#{winemaker1.id}/wines"

       click_on "All Winemakers"

       expect(current_path).to eq("/winemakers")
     end
   end
 end
