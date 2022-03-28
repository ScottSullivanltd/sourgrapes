class AddWinemakerToWines < ActiveRecord::Migration[5.2]
  def change
    add_reference :wines, :winemaker, foreign_key: true
  end
end
