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
    describe "#formatted_date" do
      it "returns #created_at in a readable format" do
        winemaker1 = Winemaker.create!(name: "Mondovete", region: "Napa Valley", public_tasting: false, vineyard_acreage: 85)

        expect(winemaker1.formatted_date).to eq(Time.now.utc.strftime("%B %d %Y %I:%M %P %Z"))
      end
    end
  end
end
