# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_05_134251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.boolean "available", default: false
    t.integer "bedrooms"
    t.integer "rental_price"
    t.integer "size"
    t.integer "build_year"
    t.string "letting_status"
    t.integer "deposit_amount"
    t.bigint "tenant_id"
    t.bigint "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.integer "bathrooms"
    t.index ["landlord_id"], name: "index_flats_on_landlord_id"
    t.index ["tenant_id"], name: "index_flats_on_tenant_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.boolean "landlord", default: false
    t.string "profile_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viewings", force: :cascade do |t|
    t.text "message"
    t.bigint "tenant_id"
    t.bigint "landlord_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_viewings_on_flat_id"
    t.index ["landlord_id"], name: "index_viewings_on_landlord_id"
    t.index ["tenant_id"], name: "index_viewings_on_tenant_id"
  end

  add_foreign_key "flats", "users", column: "landlord_id"
  add_foreign_key "flats", "users", column: "tenant_id"
  add_foreign_key "reviews", "flats"
  add_foreign_key "viewings", "flats"
  add_foreign_key "viewings", "users", column: "landlord_id"
  add_foreign_key "viewings", "users", column: "tenant_id"
end
