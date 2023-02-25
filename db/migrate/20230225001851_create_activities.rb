class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :care_type
      t.text :note
      t.integer :plant_id
      t.datetime :care_at
      t.integer :owner_id

      t.timestamps
    end
  end
end
