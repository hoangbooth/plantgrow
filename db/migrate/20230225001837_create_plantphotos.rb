class CreatePlantphotos < ActiveRecord::Migration[6.0]
  def change
    create_table :plantphotos do |t|
      t.string :image
      t.string :caption
      t.integer :plant_id
      t.integer :owner_id
      t.boolean :cover

      t.timestamps
    end
  end
end
