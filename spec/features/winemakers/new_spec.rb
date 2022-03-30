require 'rails_helper'

 RSpec.describe 'Winemaker Creation' do
  describe 'User Story 11, Winemaker Creation', type: :feature do

    it "Winemaker Index page links to a form that creates a new Winemaker record" do

      visit '/winemakers'
      click_link("New Winemaker")

      expect(current_path).to eq("/winemakers/new")
    end

    it "submits form and returns to Winemaker Index page to display new Winemaker" do

      visit "/winemakers/new"

      fill_in('Name', with: 'Elk Grove')
      fill_in('Region', with: 'Russian River')
      fill_in('Public Tasting', with: true)
      fill_in('Vineyard Acreage', with: 220)
      click_button('Create Winemaker')

      expect(current_path).to eq('/winemakers')
      expect(page).to have_content('Elk Grove')
      expect(page).to have_content('Russian River')
      expect(page).to have_content(220)
    end
  end
 end
