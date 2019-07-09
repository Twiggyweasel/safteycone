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

ActiveRecord::Schema.define(version: 2019_07_06_201547) do

  create_table "asset_checks", force: :cascade do |t|
    t.string "record_number"
    t.float "odometer_reading"
    t.text "remarks"
    t.boolean "has_defects", default: false
    t.boolean "cleared", default: false
    t.string "checkable_type"
    t.integer "checkable_id"
    t.integer "report_id"
    t.integer "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_asset_checks_on_asset_id"
    t.index ["checkable_type", "checkable_id"], name: "index_asset_checks_on_checkable_type_and_checkable_id"
    t.index ["report_id"], name: "index_asset_checks_on_report_id"
  end

  create_table "asset_checks_defects", id: false, force: :cascade do |t|
    t.integer "defect_id", null: false
    t.integer "asset_check_id", null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string "type"
    t.string "asset_number"
    t.date "last_service_date"
    t.float "last_odo_reading"
    t.datetime "last_odo_read_date"
    t.boolean "is_active", default: true
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_assets_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "provision_key"
    t.integer "user_cap"
    t.boolean "has_app_access", default: true
    t.boolean "has_admin_access", default: true
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defects", force: :cascade do |t|
    t.string "name"
    t.boolean "is_truck_defect", default: false
    t.boolean "is_trailer_defect", default: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "record_number"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "completion_date"
    t.boolean "cleared_for_use"
    t.boolean "is_complete"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "vehicle_number"
    t.date "last_service_date"
    t.float "last_odometer_reading"
    t.datetime "last_odometer_date"
    t.boolean "is_active", default: false
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_trucks_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "employee_number"
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.integer "notification_pref"
    t.integer "account_type"
    t.boolean "is_active", default: true
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
