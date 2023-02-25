# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_25_001905) do

  create_table "activities", force: :cascade do |t|
    t.string "care_type"
    t.text "note"
    t.integer "plant_id"
    t.datetime "care_at"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "follow_requests", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "fan_id"
    t.integer "plant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plantphotos", force: :cascade do |t|
    t.string "image"
    t.string "caption"
    t.integer "plant_id"
    t.integer "owner_id"
    t.boolean "cover"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plants", force: :cascade do |t|
    t.integer "species_id"
    t.integer "owner_id"
    t.boolean "dead"
    t.integer "room_id"
    t.string "name"
    t.integer "water_interval"
    t.date "water_next_at"
    t.integer "likes_count"
    t.integer "plantphotos_count"
    t.integer "activities_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "roomtype"
    t.string "roomname"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "nickname"
    t.string "cover"
    t.string "location"
    t.string "binoname"
    t.string "difficulty"
    t.string "water_type"
    t.string "sun_type"
    t.string "about"
    t.string "instruction"
    t.boolean "pet_friendly"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "bio"
    t.string "city"
    t.string "name"
    t.string "profilepic"
    t.boolean "private"
    t.integer "sent_follow_requests_count"
    t.integer "received_follow_requests_count"
    t.integer "own_plants_count"
    t.integer "plantphotos_count"
    t.integer "activities_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
