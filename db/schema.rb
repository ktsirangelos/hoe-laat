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

ActiveRecord::Schema[8.0].define(version: 2025_05_04_152621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "appointment_attendees", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.string "attendee_type", null: false
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id", "attendee_type", "attendee_id"], name: "index_appointment_attendees_on_appointment_and_attendee"
    t.index ["appointment_id"], name: "index_appointment_attendees_on_appointment_id"
    t.index ["attendee_type", "attendee_id"], name: "index_appointment_attendees_on_attendee"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "scheduled_time"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_appointments_on_creator_id"
  end

  create_table "arrivals", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "tracker_id", null: false
    t.string "trackable_type", null: false
    t.bigint "trackable_id", null: false
    t.datetime "promised_time"
    t.datetime "actual_time"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_arrivals_on_appointment_id"
    t.index ["trackable_type", "trackable_id"], name: "index_arrivals_on_trackable"
    t.index ["tracker_id"], name: "index_arrivals_on_tracker_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_contacts_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointment_attendees", "appointments"
  add_foreign_key "appointments", "users", column: "creator_id"
  add_foreign_key "arrivals", "appointments"
  add_foreign_key "arrivals", "users", column: "tracker_id"
end
