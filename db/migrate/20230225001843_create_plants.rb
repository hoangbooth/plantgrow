class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.integer :species_id
      t.integer :owner_id
      t.boolean :dead
      t.integer :room_id
      t.string :name
      t.integer :water_interval
      t.date :water_next_at
      t.integer :likes_count
      t.integer :plantphotos_count
      t.integer :activities_count

      t.timestamps
    end
  end
end
