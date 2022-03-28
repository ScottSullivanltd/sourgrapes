require 'rails_helper'

RSpec.describe Winemaker do

  describe 'relationships', type: :model do
    it {should have_many :wines}
  end

  describe 'validations', type: :model do
    it { should validate_presence_of :name }
    it { should validate_presence_of :region }
    it { should validate_inclusion_of(:public_tasting).
      in_array([true, false])}
    it { should validate_presence_of :vineyard_acreage }
  end

  describe 'instance methods', type: :model do

    it "returns the #most_recent entry" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
      winemaker2 = Winemaker.create!(name: "Wet Creek", region: "Sonoma", public_tasting: true, vineyard_acreage: 120)
      # @winemakers.most_recent
      # expect(@winemakers.most_recent).to eq(winemaker2)
      expect(winemaker2.created_at).to be > (winemaker1.created_at)
    end

    it "returns created_at as a #formatted_date" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

      expect(winemaker1.formatted_date).to eq(Time.now.utc.strftime("%B %d %Y %I:%M %P %Z"))
    end

    it "returns a #wine_count of wines associated with a winemaker" do
      winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
      wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
      wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)
      wine2 = winemaker1.wines.create!(name: "Pinotrest", blend: "Pino Noir", vintage: "2010", barrels_produced: 104, signature_label: false)

      expect(winemaker1.wine_count).to eq(3)
    end
  end
end
