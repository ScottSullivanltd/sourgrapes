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

    describe "#wine_count" do
      it "returns a count of wines associated with a winemaker" do
        winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)
        wine1 = winemaker1.wines.create!(name: "Red Vine", blend: "Cabernet", vintage: "2002", barrels_produced: 25, signature_label: false)
        wine2 = winemaker1.wines.create!(name: "Valencia", blend: "Merlot", vintage: "2004", barrels_produced: 42, signature_label: true)
        wine2 = winemaker1.wines.create!(name: "Pinotrest", blend: "Pino Noir", vintage: "2010", barrels_produced: 104, signature_label: false)

        expect(winemaker1.wine_count).to eq(3)
      end
    end
  end
end
