require 'rails_helper'

 RSpec.describe 'User Story 4' do
   describe 'child show page' do
     it "can see a wine with all its attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/wines/#{wine1.id}"

       expect(page).to have_content(wine1.name)
       expect(page).to_not have_content(wine2.name)
       expect(page).to have_content(wine1.blend)
       expect(page).to_not have_content(wine2.blend)
       expect(page).to have_content(wine1.vintage)
       expect(page).to_not have_content(wine2.vintage)
       expect(page).to have_content(wine1.barrels_produced)
       expect(page).to_not have_content(wine2.barrels_produced)
       expect(page).to have_content(wine1.signature_label)
       expect(page).to_not have_content(wine2.signature_label)
     end
   end
 end
