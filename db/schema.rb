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

ActiveRecord::Schema.define(version: 2019_10_24_091237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.integer "project_id"
    t.integer "donator_id"
    t.integer "quantity_donated"
    t.string "status", default: "aguardando doação"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donator_id"], name: "index_donations_on_donator_id"
    t.index ["project_id"], name: "index_donations_on_project_id"
  end

  create_table "donators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "cpf"
    t.string "telephone"
    t.index ["email"], name: "index_donators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_donators_on_reset_password_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.integer "donator_id"
    t.string "status"
    t.date "date"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_cents", default: 0, null: false
    t.index ["donator_id"], name: "index_payments_on_donator_id"
  end

  create_table "project_photos", force: :cascade do |t|
    t.string "photo"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_photos_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "title"
    t.string "description"
    t.string "material"
    t.integer "quantity"
    t.integer "average_unit_price"
    t.string "category"
    t.string "school_year"
    t.date "limit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Aberto"
    t.integer "total_donations"
    t.index ["teacher_id"], name: "index_projects_on_teacher_id"
  end

  create_table "schools", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "avatar"
    t.string "registration_code"
    t.string "course"
    t.string "telephone"
    t.integer "school_id"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

end
