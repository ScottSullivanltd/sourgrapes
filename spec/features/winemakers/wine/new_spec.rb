require 'rails_helper'

 RSpec.describe 'Winemaker Wine Creation' do
   describe 'User Story 13, Winemaker Wine Creation', type: :feature do
     it "Winemaker Wine Index page links to a form to a add new Wine to that Winemaker" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

       visit "/winemakers/#{winemaker1.id}/wines"
       click_link("Create Wine")

       expect(current_path).to eq("/winemakers/#{winemaker1.id}/wines/new")
     end

     it "submits New Wine form and returns to Winemaker Wine Index page to display new Wine" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

       visit "/winemakers/#{winemaker1.id}/wines/new"

       fill_in('Name', with: 'Violet Table')
       fill_in('Blend', with: 'Pinot Noir')
       fill_in('Vintage', with: '2015')
       fill_in('Barrels Produced', with: 52)
       fill_in('Signature Label', with: false)
       click_button('Create Wine')

       expect(current_path).to eq("/winemakers/#{winemaker1.id}/wines")
       expect(page).to have_content('Violet Table')
       expect(page).to have_content('Pinot Noir')
       expect(page).to have_content('Pinot Noir')
       expect(page).to have_content(52)
       expect(page).to have_content(false)
     end
   end
 end
