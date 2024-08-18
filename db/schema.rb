# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_18_154118) do
  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.integer "property_type_id", null: false
    t.string "rooms"
    t.integer "area"
    t.decimal "cost"
    t.integer "location_id", null: false
    t.string "main_photo_1"
    t.string "main_photo_2"
    t.string "main_photo_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_properties_on_location_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_property_categories_on_name", unique: true
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "property_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "property_category_id"], name: "index_property_types_on_name_and_property_category_id", unique: true
    t.index ["property_category_id"], name: "index_property_types_on_property_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "locations"
  add_foreign_key "properties", "property_types"
  add_foreign_key "property_types", "property_categories"
end
