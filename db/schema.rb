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

ActiveRecord::Schema.define(version: 2019_07_09_140240) do

  create_table "education_backgrounds", force: :cascade do |t|
    t.string "university"
    t.string "major"
    t.date "graduation_date"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_education_backgrounds_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "current_role"
    t.string "career_goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "picture"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "project_experiences", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "description"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_project_experiences_on_profile_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "proficiency"
    t.string "skills"
    t.string "description"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_skills_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "company"
    t.string "role"
    t.date "start_date"
    t.date "end_date"
    t.string "city"
    t.string "description"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_work_experiences_on_profile_id"
  end

end
