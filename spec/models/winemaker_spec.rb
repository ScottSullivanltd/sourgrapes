require 'rails_helper'

RSpec.describe Winemaker, type: :model do

  describe 'relationships' do
    it {should have_many :wines}
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :region }
    it { should validate_inclusion_of(:public_tasting).
      in_array([true, false])}
    it { should validate_presence_of :vineyard_acreage }
  end

  describe "instance methods" do
    describe '#most_recent' do
      it "returns the most recent entry" do
        winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
        winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)
        
        expect(winemaker2.created_at).to be > (winemaker1.created_at)
      end
    end

    describe "#formatted_date" do
      it "returns #created_at in a readable format" do
        winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

        expect(winemaker1.formatted_date).to eq(Time.now.utc.strftime("%B %d %Y %I:%M %P %Z"))
      end
    end
  end
end
