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

ActiveRecord::Schema.define(version: 2019_09_24_054618) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_addresses_on_warehouse_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "warehouse_id"
    t.integer "service_id"
    t.integer "sector_experience_id"
    t.integer "certificate_id"
    t.integer "connection_id"
    t.integer "equipment_id"
    t.integer "warehousetype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "config_id"
    t.index ["certificate_id"], name: "index_assignments_on_certificate_id"
    t.index ["config_id"], name: "index_assignments_on_config_id"
    t.index ["connection_id"], name: "index_assignments_on_connection_id"
    t.index ["equipment_id"], name: "index_assignments_on_equipment_id"
    t.index ["sector_experience_id"], name: "index_assignments_on_sector_experience_id"
    t.index ["service_id"], name: "index_assignments_on_service_id"
    t.index ["warehouse_id"], name: "index_assignments_on_warehouse_id"
    t.index ["warehousetype_id"], name: "index_assignments_on_warehousetype_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.date "day"
    t.integer "price"
    t.integer "status"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_calendars_on_warehouse_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.string "cert_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_certificates_on_warehouse_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.string "VATnumber"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "configs", force: :cascade do |t|
    t.string "config_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_configs_on_warehouse_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "connection_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_connections_on_warehouse_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "equipment_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_equipment_on_warehouse_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "operating_hours", force: :cascade do |t|
    t.time "monday_from"
    t.time "monday_to"
    t.time "tuesday_from"
    t.time "tuesday_to"
    t.time "wednesday_from"
    t.time "wednesday_to"
    t.time "thursday_from"
    t.time "thursday_to"
    t.time "friday_from"
    t.time "friday_to"
    t.time "sat_from"
    t.time "sat_to"
    t.time "sunday_from"
    t.time "sunday_to"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_operating_hours_on_warehouse_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["warehouse_id"], name: "index_photos_on_warehouse_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_properties_on_warehouse_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "warehouse_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total"
    t.integer "status", default: 0
    t.integer "booking_size"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["warehouse_id"], name: "index_reservations_on_warehouse_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "star", default: 1
    t.integer "warehouse_id"
    t.integer "reservation_id"
    t.integer "guest_id"
    t.integer "host_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["host_id"], name: "index_reviews_on_host_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["warehouse_id"], name: "index_reviews_on_warehouse_id"
  end

  create_table "sector_experiences", force: :cascade do |t|
    t.string "experience_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_sector_experiences_on_warehouse_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_services_on_warehouse_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "enable_sms", default: true
    t.boolean "enable_email", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "phone_number"
    t.text "description"
    t.string "pin"
    t.boolean "phone_verified"
    t.string "stripe_id"
    t.string "merchant_id"
    t.integer "unread", default: 0
    t.integer "role"
    t.string "subaccount"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouse_categories", force: :cascade do |t|
    t.string "category"
    t.text "category_description"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_warehouse_categories_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "title"
    t.integer "total_size"
    t.text "description"
    t.string "youtube_url"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.decimal "price"
    t.string "address"
    t.boolean "active"
    t.float "latitude"
    t.float "longitude"
    t.integer "instant", default: 1
    t.index ["company_id"], name: "index_warehouses_on_company_id"
    t.index ["user_id"], name: "index_warehouses_on_user_id"
  end

  create_table "warehousetypes", force: :cascade do |t|
    t.string "type_item"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_warehousetypes_on_warehouse_id"
  end

end
