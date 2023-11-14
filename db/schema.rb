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

ActiveRecord::Schema[7.0].define(version: 2023_11_14_153952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "geo_point"
    t.string "category"
    t.string "address"
    t.string "actual_zipcode"
    t.boolean "free_trial"
    t.boolean "is_looking_for_volunteer"
    t.string "subcategories"
    t.string "recurrence"
    t.string "subscription_link"
    t.text "short_description"
    t.text "full_description"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images", default: [], array: true
    t.string "category_number"
    t.string "subcategory_number"
    t.string "phone_number"
    t.string "other_subcategory"
    t.index ["club_id"], name: "index_activities_on_club_id"
  end

  create_table "claims", force: :cascade do |t|
    t.string "full_name"
    t.string "contact_email"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.bigint "club_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_claims_on_club_id"
    t.index ["user_id"], name: "index_claims_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "rna_number"
    t.string "geo_point"
    t.string "category"
    t.string "address"
    t.string "actual_zipcode"
    t.string "subcategories", default: [], array: true
    t.string "nearbyStation"
    t.string "website"
    t.text "objet"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images", default: [], array: true
    t.string "category_number"
    t.string "subcategories_number", default: [], array: true
    t.integer "structure_type"
    t.string "phone_number"
    t.integer "adherence_fee"
    t.boolean "is_premium", default: false
    t.string "google_review_client_id"
    t.boolean "inscription_open_all_year", default: true
    t.date "inscription_start_date"
    t.date "inscription_end_date"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "sub_group_id", null: false
    t.string "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "time_slot_id"
    t.index ["sub_group_id"], name: "index_schedules_on_sub_group_id"
    t.index ["time_slot_id"], name: "index_schedules_on_time_slot_id"
  end

  create_table "sub_groups", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.string "name"
    t.integer "min_price_cents", comment: "Stored in cents"
    t.integer "max_price_cents", comment: "Stored in cents"
    t.string "recurrence"
    t.string "class_type"
    t.text "short_description"
    t.integer "subscription_by_recurrence_price_cents", comment: "Stored in cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "tarifications", default: [], array: true
    t.index ["activity_id"], name: "index_sub_groups_on_activity_id"
  end

  create_table "tarifications", force: :cascade do |t|
    t.integer "amount"
    t.string "recurrence"
    t.string "label"
    t.string "description"
    t.bigint "sub_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_group_id"], name: "index_tarifications_on_sub_group_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.bigint "schedule_id"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_time_slots_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sub_id"
    t.integer "role", default: 0
    t.string "uid"
    t.string "provider"
    t.string "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "clubs"
  add_foreign_key "claims", "clubs"
  add_foreign_key "claims", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "schedules", "sub_groups"
  add_foreign_key "schedules", "time_slots"
  add_foreign_key "sub_groups", "activities"
  add_foreign_key "tarifications", "sub_groups"
  add_foreign_key "time_slots", "schedules"
end
