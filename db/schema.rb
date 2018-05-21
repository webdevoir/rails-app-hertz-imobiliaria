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

ActiveRecord::Schema.define(version: 20180505224305) do

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

  create_table "contact_forms", force: :cascade do |t|
    t.string "name"
    t.string "telefone"
    t.string "email"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_contact_forms_on_property_id"
  end

  create_table "details_types", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", id: :serial, force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "landlords", id: :serial, force: :cascade do |t|
    t.string "name", default: ""
    t.string "rg", default: ""
    t.string "cpf", default: ""
    t.date "birthday"
    t.string "martial_status", default: ""
    t.string "profession", default: ""
    t.string "phone1", default: ""
    t.string "phone2", default: ""
    t.string "email", default: ""
    t.string "cep", default: ""
    t.string "country", default: "BR"
    t.string "state", default: ""
    t.string "city", default: ""
    t.string "neighborhood", default: ""
    t.string "street", default: ""
    t.string "number", default: ""
    t.string "complement", default: ""
    t.string "condo_name", default: ""
    t.boolean "deposit", default: false
    t.decimal "adm_rate", default: "0.0"
    t.decimal "first_rate", default: "0.0"
    t.string "type_of_account", default: ""
    t.string "bank", default: ""
    t.string "agency", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", id: :serial, force: :cascade do |t|
    t.integer "landlord_id"
    t.boolean "sale", default: false
    t.boolean "rent", default: false
    t.string "bussiness_type", default: ""
    t.string "property_type", default: ""
    t.string "condition", default: ""
    t.string "position", default: ""
    t.string "style", default: ""
    t.integer "construction_year"
    t.integer "bathrooms", default: 0
    t.integer "rooms", default: 0
    t.integer "garages", default: 0
    t.integer "suites", default: 0
    t.text "description", default: ""
    t.text "sell_conditions", default: ""
    t.text "rent_guarantee", default: ""
    t.text "observations", default: ""
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

  add_foreign_key "contact_forms", "properties"
  add_foreign_key "properties", "landlords"
  add_foreign_key "property_addresses", "properties"
  add_foreign_key "property_areas", "properties"
  add_foreign_key "property_details", "details_types"
  add_foreign_key "property_details", "properties"
  add_foreign_key "property_values", "properties"
end
