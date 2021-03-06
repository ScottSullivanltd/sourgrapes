require 'rails_helper'

 RSpec.describe 'Wines Index page' do

   describe 'User Story 3, Wines Index', type: :feature do
     it "can see all wines and attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/wines"

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

       visit "/wines"

       click_on "All Wines"

       expect(current_path).to eq("/wines")
     end
   end

   describe 'User Story 9, Winemaker Index Link', type: :feature do
     it "links to the Winemaker Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)

       visit "/wines"

       click_on "All Winemakers"

       expect(current_path).to eq("/winemakers")
     end
   end

   describe 'User Story 15, Wine Index only shows records that are true', type: :feature do
     it "shows only records with boolean column as true" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
       wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)
       wine3 = winemaker1.wines.create!(name: "Pinotrest", blend: "Pinot Noir", vintage: "2010", barrels_produced: 104, signature_label: false)
       wine4 = winemaker1.wines.create!(name: "Chambrala", blend: "Chardonnay", vintage: "2018", barrels_produced: 99, signature_label: true)

       visit "/wines"

       expected = [wine2, wine4]

       expect(Wine.is_true).to eq(expected)
     end
   end

   describe 'User Story 18, Wine Update from Wine Index Page', type: :feature do

     it "Wine Index page links to a form that edits the Wine attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2012", barrels_produced: 25, signature_label: false)

       visit "/wines"
       within("#wine-#{wine1.id}") do
         click_link("Update Wine")
       end

       expect(current_path).to eq("/wines/#{wine1.id}/edit")
     end

     it "submits edited form and returns to Wine Show page and displays updated Wine" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Rod Vane", blend: "Cabronet", vintage: "1912", barrels_produced: 125, signature_label: true)

       visit "/wines"

       expect(page).to have_content('Rod Vane')
       expect(page).to have_content('Cabronet')
       expect(page).to have_content('1912')
       expect(page).to have_content(125)
       expect(page).to have_content(true)

       click_link 'Update Wine'

       fill_in('Name', with: 'Red Vine')
       fill_in('Blend', with: 'Cabernet')
       fill_in('Vintage', with: '2012')
       fill_in('Barrels Produced', with: 25)
       fill_in('Signature Label', with: false)
       click_button 'Update Wine'

       expect(current_path).to eq("/wines/#{wine1.id}")
       expect(page).to have_content('Red Vine')
       expect(page).to have_content('Cabernet')
       expect(page).to have_content('2012')
       expect(page).to have_content(25)
       expect(page).to have_content(false)
     end
   end

   describe 'User Story 23, Wine Delete From Wine Index Page', type: :feature do
     it "Wine Index page has link to delete a Wine then return to Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)

       visit "/wines"
       click_link "Delete Wine"

       expect(current_path).to eq("/wines")
       expect(page).to_not have_content(wine1)
     end
   end
 end
