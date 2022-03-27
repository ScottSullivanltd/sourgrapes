require 'rails_helper'

RSpec.describe Wine, type: :model do
  it {should belong_to :winemaker}

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :blend }
    it { should validate_presence_of :vintage }
    it { should validate_numericality_of(:barrels_produced).only_integer }
    it { should validate_inclusion_of(:signature_label).
      in_array([true, false])}
  end
end
