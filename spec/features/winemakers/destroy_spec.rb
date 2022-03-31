require 'rails_helper'

 RSpec.describe 'Winemaker Destroy' do
   describe 'User Story 19, Winemaker Delete', type: :feature do
     it "has link to delete a Winemaker" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)

       visit "/winemakers/#{winemaker1.id}"
       click_link "Delete Winemaker"

       expect(current_path).to eq("/winemakers")
       expect(page).to_not have_content(winemaker1)
     end
   end
 end
