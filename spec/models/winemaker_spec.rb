require 'rails_helper'

RSpec.describe Winemaker, type: :model do
  it {should have_many :wines}

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :region }
    it { should validate_inclusion_of(:public_tasting).
      in_array([true, false])}
    it { should validate_presence_of :vineyard_acreage }
  end
end
