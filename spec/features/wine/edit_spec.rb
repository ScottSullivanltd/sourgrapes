require 'rails_helper'

 RSpec.describe 'Wine Update' do
  describe 'User Story 14, Wine Update', type: :feature do

    it "Wine Show page links to a form that edits the Wine attributes" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
      wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2012", barrels_produced: 25, signature_label: false)

      visit "/wines/#{wine1.id}"
      click_button("Update #{wine1.name}")

      expect(current_path).to eq("/wines/#{wine1.id}/edit")
    end

    it "submits edited form and returns to Wine Show page and displays updated Wine" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
      wine1 = winemaker1.wines.create!(name: "Rod Vane", blend: "Cabronet", vintage: "1912", barrels_produced: 125, signature_label: true)

      visit "/wines/#{wine1.id}"

      expect(page).to have_content('Rod Vane')
      expect(page).to have_content('Cabronet')
      expect(page).to have_content('1912')
      expect(page).to have_content(125)
      expect(page).to have_content(true)

      click_button 'Update Rod Vane'

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
 end
