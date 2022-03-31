require 'rails_helper'

 RSpec.describe 'Wine Destroy' do
   describe 'User Story 20, Wine Delete', type: :feature do
     it "Wine Show page has link to delete a Wine then return to Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/wines/#{wine1.id}"
       click_link "Delete Wine"

       expect(current_path).to eq("/wines")
       expect(page).to_not have_content(wine1)
     end
   end
 end
