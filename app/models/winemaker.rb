class Winemaker < ApplicationRecord
  validates :name, presence: true
  validates :region, presence: true
  validates :vineyard_acreage, presence: true
end
