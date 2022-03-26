class Winemaker < ApplicationRecord
  has_many :wines
  
  validates_presence_of :name
  validates_presence_of :region
  validates :public_tasting, inclusion: [true, false]
  validates_presence_of :vineyard_acreage

end
