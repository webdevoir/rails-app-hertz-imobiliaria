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

ActiveRecord::Schema.define(version: 20171218220803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "details_types", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "rg"
    t.string "cpf"
    t.date "birthday"
    t.string "martial_status"
    t.string "profession"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.string "cep"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "condo_name"
    t.boolean "deposit"
    t.decimal "adm_rate"
    t.decimal "first_rate"
    t.string "type_of_account"
    t.string "bank"
    t.string "agency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", id: :serial, force: :cascade do |t|
    t.integer "landlord_id"
    t.boolean "sale", default: false
    t.boolean "rent", default: false
    t.string "bussiness_type"
    t.string "property_type"
    t.string "condition"
    t.string "position"
    t.string "style"
    t.integer "construction_year"
    t.integer "bathrooms"
    t.integer "rooms"
    t.integer "garages"
    t.integer "suites"
    t.text "description"
    t.text "conditions_business"
    t.text "observations"
    t.boolean "published", default: true
    t.boolean "featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "property_addresses", id: :serial, force: :cascade do |t|
    t.string "cep"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "condo_name"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["property_id"], name: "index_property_addresses_on_property_id"
  end

  create_table "property_areas", id: :serial, force: :cascade do |t|
    t.string "scale"
    t.float "total"
    t.float "usable"
    t.float "land"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_areas_on_property_id"
  end

  create_table "property_details", id: :serial, force: :cascade do |t|
    t.integer "property_id"
    t.integer "details_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["details_type_id"], name: "index_property_details_on_details_type_id"
    t.index ["property_id"], name: "index_property_details_on_property_id"
  end

  create_table "property_values", id: :serial, force: :cascade do |t|
    t.decimal "rent"
    t.decimal "sell"
    t.decimal "iptu"
    t.decimal "condominium"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_values_on_property_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "landlords"
  add_foreign_key "property_addresses", "properties"
  add_foreign_key "property_areas", "properties"
  add_foreign_key "property_details", "details_types"
  add_foreign_key "property_details", "properties"
  add_foreign_key "property_values", "properties"
end
