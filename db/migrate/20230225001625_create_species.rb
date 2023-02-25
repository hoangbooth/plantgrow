class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :nickname
      t.string :cover
      t.string :location
      t.string :binoname
      t.string :difficulty
      t.string :water_type
      t.string :sun_type
      t.string :about
      t.string :instruction
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
