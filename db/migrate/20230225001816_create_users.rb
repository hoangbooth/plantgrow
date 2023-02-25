class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :bio
      t.string :city
      t.string :name
      t.string :profilepic
      t.boolean :private
      t.integer :sent_follow_requests_count
      t.integer :received_follow_requests_count
      t.integer :own_plants_count
      t.integer :plantphotos_count
      t.integer :activities_count

      t.timestamps
    end
  end
end
