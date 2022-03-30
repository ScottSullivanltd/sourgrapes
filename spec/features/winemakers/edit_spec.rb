require 'rails_helper'

 RSpec.describe 'Winemaker Update' do
  describe 'User Story 12, Winemaker Update', type: :feature do

    it "Winemaker Show page links to a form that edits the Winemaker attributes" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

      visit "/winemakers/#{winemaker1.id}"
      click_link("Update #{winemaker1.name}")

      expect(current_path).to eq("/winemakers/#{winemaker1.id}/edit")
    end

    it "submits edit form and returns to Winemaker Show page and displays updated Winemaker" do
      winemaker1 = Winemaker.create!(name: "Mondovoot", region: "Nape Valley", public_tasting: true, vineyard_acreage: 15)

      visit "/winemakers/#{winemaker1.id}"

      expect(page).to have_content('Mondovoot')
      expect(page).to have_content('Nape Valley')
      expect(page).to have_content(true)
      expect(page).to have_content(15)

      click_link 'Update Mondovoot'

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
 end
