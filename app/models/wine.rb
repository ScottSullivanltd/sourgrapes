class Wine < ApplicationRecord
  belongs_to :winemaker

  validates_presence_of :name
  validates_presence_of :blend
  validates_presence_of :vintage
  validates_numericality_of :barrels_produced, only_integer: true
  validates :signature_label, inclusion: [true, false]

  def self.is_true
    where(signature_label: true)
  end

  def self.sort_alphabetically
    order(:name)
  end
end
