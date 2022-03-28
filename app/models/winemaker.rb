class Winemaker < ApplicationRecord
  has_many :wines

  validates_presence_of :name
  validates_presence_of :region
  validates :public_tasting, inclusion: [true, false]
  validates_presence_of :vineyard_acreage

  def self.most_recent
    order(created_at: :desc)
  end

  def formatted_date
    created_at.strftime("%B %d %Y %I:%M %P %Z")
  end

  def wine_count
    wines.count
  end

end
