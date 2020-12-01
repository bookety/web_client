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

ActiveRecord::Schema.define(version: 2020_12_01_040551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "number"
    t.string "city"
    t.string "complement"
    t.string "address_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "available_times", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_addresses", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_client_addresses_on_address_id"
    t.index ["client_id"], name: "index_client_addresses_on_client_id"
  end

  create_table "client_documents", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_documents_on_client_id"
    t.index ["document_id"], name: "index_client_documents_on_document_id"
  end

  create_table "client_telephones", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "telephone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_telephones_on_client_id"
    t.index ["telephone_id"], name: "index_client_telephones_on_telephone_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "full_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "document_type"
    t.string "document_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string "fee_type"
    t.integer "fee_value_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "place_addresses", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_place_addresses_on_address_id"
    t.index ["place_id"], name: "index_place_addresses_on_place_id"
  end

  create_table "place_documents", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_place_documents_on_document_id"
    t.index ["place_id"], name: "index_place_documents_on_place_id"
  end

  create_table "place_telephones", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "telephone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_place_telephones_on_place_id"
    t.index ["telephone_id"], name: "index_place_telephones_on_telephone_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "company_name"
    t.string "fantasy_name"
    t.string "admin_full_name"
    t.string "admin_job_position"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "professional_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_professional_addresses_on_address_id"
    t.index ["professional_id"], name: "index_professional_addresses_on_professional_id"
  end

  create_table "professional_documents", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_professional_documents_on_document_id"
    t.index ["professional_id"], name: "index_professional_documents_on_professional_id"
  end

  create_table "professional_fees", force: :cascade do |t|
    t.bigint "fee_id", null: false
    t.bigint "professional_id", null: false
    t.bigint "available_time_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["available_time_id"], name: "index_professional_fees_on_available_time_id"
    t.index ["fee_id"], name: "index_professional_fees_on_fee_id"
    t.index ["professional_id"], name: "index_professional_fees_on_professional_id"
  end

  create_table "professional_places", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_professional_places_on_place_id"
    t.index ["professional_id"], name: "index_professional_places_on_professional_id"
  end

  create_table "professional_telephones", force: :cascade do |t|
    t.bigint "telephone_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["professional_id"], name: "index_professional_telephones_on_professional_id"
    t.index ["telephone_id"], name: "index_professional_telephones_on_telephone_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "professional_type"
    t.string "specialties"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_professionals_on_user_id"
  end

  create_table "room_fees", force: :cascade do |t|
    t.bigint "fee_id", null: false
    t.bigint "room_id", null: false
    t.bigint "available_time_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["available_time_id"], name: "index_room_fees_on_available_time_id"
    t.index ["fee_id"], name: "index_room_fees_on_fee_id"
    t.index ["room_id"], name: "index_room_fees_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.string "room_number"
    t.bigint "place_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_rooms_on_place_id"
  end

  create_table "telephones", force: :cascade do |t|
    t.string "telephone_type"
    t.string "telephone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "professional_fee_id", null: false
    t.bigint "room_fee_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_transactions_on_client_id"
    t.index ["professional_fee_id"], name: "index_transactions_on_professional_fee_id"
    t.index ["room_fee_id"], name: "index_transactions_on_room_fee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_addresses", "addresses"
  add_foreign_key "client_addresses", "clients"
  add_foreign_key "client_documents", "clients"
  add_foreign_key "client_documents", "documents"
  add_foreign_key "client_telephones", "clients"
  add_foreign_key "client_telephones", "telephones"
  add_foreign_key "clients", "users"
  add_foreign_key "place_addresses", "addresses"
  add_foreign_key "place_addresses", "places"
  add_foreign_key "place_documents", "documents"
  add_foreign_key "place_documents", "places"
  add_foreign_key "place_telephones", "places"
  add_foreign_key "place_telephones", "telephones"
  add_foreign_key "places", "users"
  add_foreign_key "professional_addresses", "addresses"
  add_foreign_key "professional_addresses", "professionals"
  add_foreign_key "professional_documents", "documents"
  add_foreign_key "professional_documents", "professionals"
  add_foreign_key "professional_fees", "available_times"
  add_foreign_key "professional_fees", "fees"
  add_foreign_key "professional_fees", "professionals"
  add_foreign_key "professional_places", "places"
  add_foreign_key "professional_places", "professionals"
  add_foreign_key "professional_telephones", "professionals"
  add_foreign_key "professional_telephones", "telephones"
  add_foreign_key "professionals", "users"
  add_foreign_key "room_fees", "available_times"
  add_foreign_key "room_fees", "fees"
  add_foreign_key "room_fees", "rooms"
  add_foreign_key "rooms", "places"
  add_foreign_key "transactions", "clients"
  add_foreign_key "transactions", "professional_fees"
  add_foreign_key "transactions", "room_fees"
end
