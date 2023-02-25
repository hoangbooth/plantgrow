class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :roomtype
      t.string :roomname
      t.integer :owner_id

      t.timestamps
    end
  end
end
