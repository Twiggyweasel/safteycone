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

ActiveRecord::Schema.define(version: 2019_05_28_204409) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "provision_key"
    t.integer "user_cap"
    t.boolean "has_app_access", default: true
    t.boolean "has_admin_access", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defects", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defects_truck_checks", id: false, force: :cascade do |t|
    t.integer "defect_id", null: false
    t.integer "truck_check_id", null: false
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

  create_table "truck_checks", force: :cascade do |t|
    t.string "record_number"
    t.float "odometer_reading"
    t.boolean "has_defects", default: false
    t.boolean "is_cleared", default: false
    t.text "remarks"
    t.integer "report_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_truck_checks_on_report_id"
    t.index ["truck_id"], name: "index_truck_checks_on_truck_id"
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
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
