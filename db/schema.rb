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

ActiveRecord::Schema[7.0].define(version: 2023_11_02_144616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["club_id"], name: "index_activities_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "rna_number"
    t.string "geo_point"
    t.string "category"
    t.string "address"
    t.string "actual_zipcode"
    t.string "subcategory"
    t.string "nearbyStation"
    t.string "website"
    t.text "objet"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images", default: [], array: true
    t.string "category_number"
    t.string "subcategory_number"
    t.integer "structure_type"
    t.string "phone_number"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "start_time"
    t.string "end_time"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "clubs"
  add_foreign_key "clubs", "users"
  add_foreign_key "schedules", "sub_groups"
  add_foreign_key "schedules", "time_slots"
  add_foreign_key "sub_groups", "activities"
  add_foreign_key "tarifications", "sub_groups"
  add_foreign_key "time_slots", "schedules"
end
