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

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "details", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "details_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["details_type_id"], name: "index_details_on_details_type_id", using: :btree
    t.index ["property_id"], name: "index_details_on_property_id", using: :btree
  end

  create_table "details_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exterior_details", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "exterior_details_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["exterior_details_type_id"], name: "index_exterior_details_on_exterior_details_type_id", using: :btree
    t.index ["property_id"], name: "index_exterior_details_on_property_id", using: :btree
  end

  create_table "exterior_details_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interior_details", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "interior_details_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["interior_details_type_id"], name: "index_interior_details_on_interior_details_type_id", using: :btree
    t.index ["property_id"], name: "index_interior_details_on_property_id", using: :btree
  end

  create_table "interior_details_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.date     "birthday"
    t.string   "martial_status"
    t.string   "profession"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "cep"
    t.boolean  "deposit"
    t.decimal  "adm_rate"
    t.decimal  "first_rate"
    t.string   "type_of_account"
    t.string   "bank"
    t.string   "agency"
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_landlords_on_user_id", using: :btree
  end

  create_table "private_details", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "private_details_type_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["private_details_type_id"], name: "index_private_details_on_private_details_type_id", using: :btree
    t.index ["property_id"], name: "index_private_details_on_property_id", using: :btree
  end

  create_table "private_details_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "landlord_id"
    t.integer  "code"
    t.string   "bussiness_type"
    t.string   "property_type"
    t.string   "property_kind"
    t.string   "property_state"
    t.string   "position"
    t.string   "style"
    t.integer  "construction_year"
    t.integer  "bathrooms"
    t.integer  "rooms"
    t.integer  "garages"
    t.integer  "suites"
    t.text     "description"
    t.boolean  "published",         default: false
    t.text     "conditions"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["landlord_id"], name: "index_properties_on_landlord_id", using: :btree
  end

  create_table "property_addresses", force: :cascade do |t|
    t.string   "cep"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "condo_name"
    t.integer  "property_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["property_id"], name: "index_property_addresses_on_property_id", using: :btree
  end

  create_table "property_areas", force: :cascade do |t|
    t.string   "scale"
    t.float    "total_area"
    t.float    "usable_area"
    t.float    "area_land"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["property_id"], name: "index_property_areas_on_property_id", using: :btree
  end

  create_table "property_values", force: :cascade do |t|
    t.decimal  "value"
    t.decimal  "iptu"
    t.decimal  "condo_amount"
    t.decimal  "rate"
    t.integer  "property_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["property_id"], name: "index_property_values_on_property_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "details", "details_types"
  add_foreign_key "details", "properties"
  add_foreign_key "exterior_details", "exterior_details_types"
  add_foreign_key "exterior_details", "properties"
  add_foreign_key "interior_details", "interior_details_types"
  add_foreign_key "interior_details", "properties"
  add_foreign_key "landlords", "users"
  add_foreign_key "private_details", "private_details_types"
  add_foreign_key "private_details", "properties"
  add_foreign_key "properties", "landlords"
  add_foreign_key "property_addresses", "properties"
  add_foreign_key "property_areas", "properties"
  add_foreign_key "property_values", "properties"
end
