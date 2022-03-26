class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :type
      t.date :vintage
      t.integer :barrels_produced
      t.boolean :signature_label

      t.timestamps
    end
  end
end
