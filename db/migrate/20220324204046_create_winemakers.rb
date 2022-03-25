class CreateWinemakers < ActiveRecord::Migration[5.2]
  def change
    create_table :winemakers do |t|
      t.string :name
      t.string :region
      t.boolean :public_tasting
      t.integer :vineyard_acreage

      t.timestamps
    end
  end
end
