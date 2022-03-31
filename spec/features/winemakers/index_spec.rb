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

   describe 'User Story 17, Winemaker Update From Winemaker Index Page', type: :feature do

     it "Winemaker Index page links to a form that edits the Winemaker attributes" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

       visit "/winemakers"
       click_link('Update Winemaker')

       expect(current_path).to eq("/winemakers/#{winemaker1.id}/edit")
     end

     it "submits edit form and returns to Winemaker Show page and displays updated Winemaker" do
       winemaker1 = Winemaker.create!(name: "Mondovoot", region: "Nape Valley", public_tasting: true, vineyard_acreage: 15)

       visit "/winemakers"

       expect(page).to have_content('Mondovoot')
       expect(page).to have_content('Nape Valley')
       expect(page).to have_content(true)
       expect(page).to have_content(15)

       click_link 'Update Winemaker'

       fill_in('Name', with: 'Mondovete')
       fill_in('Region', with: 'Napa Valley')
       fill_in('Public Tasting', with: false)
       fill_in('Vineyard Acreage', with: 85)
       click_button 'Update Winemaker'

       expect(current_path).to eq("/winemakers/#{winemaker1.id}")
       expect(page).to have_content('Mondovete')
       expect(page).to have_content('Napa Valley')
       expect(page).to have_content(false)
       expect(page).to have_content(85)
     end
   end

   describe 'User Story 22, Winemaker Delete From Parent Index Page', type: :feature do
     it "Winemaker Index page has link to delete a Winemaker and associated Wine then return to Wine Index page" do
       winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
       wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)

       visit "/winemakers"
       click_link "Delete Winemaker"

       expect(current_path).to eq("/winemakers")
       expect(page).to_not have_content(winemaker1)
     end
   end
 end
