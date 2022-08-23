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

ActiveRecord::Schema.define(version: 2022_08_23_111130) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "appointment_type"
    t.datetime "time"
    t.string "location"
    t.boolean "important", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_journal_entries_on_pet_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "meal_type"
    t.text "description"
    t.string "serving_size"
    t.string "time", default: [], array: true
    t.boolean "important", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_meals_on_pet_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "dosage"
    t.date "start_date"
    t.date "end_date"
    t.date "expiration_date"
    t.text "description"
    t.string "medicine_type"
    t.boolean "important", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_medicines_on_pet_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_ownerships_on_pet_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "weight"
    t.text "description"
    t.string "chip_number"
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "pets"
  add_foreign_key "journal_entries", "pets"
  add_foreign_key "meals", "pets"
  add_foreign_key "medicines", "pets"
  add_foreign_key "ownerships", "pets"
  add_foreign_key "ownerships", "users"
end
