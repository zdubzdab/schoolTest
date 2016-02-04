# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160204103536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_settings", force: :cascade do |t|
    t.integer "question_id"
    t.boolean "rigth"
    t.string  "name"
    t.boolean "few_answers"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "answer_setting_id"
    t.integer "test_id"
    t.boolean "checked"
  end

  add_index "answers", ["test_id"], name: "index_answers_on_test_id", using: :btree

  create_table "categgories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categgories_with_subjects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.integer "categgory_id"
  end

  add_index "categgories_with_subjects", ["categgory_id"], name: "index_categgories_with_subjects_on_categgory_id", using: :btree
  add_index "categgories_with_subjects", ["subject_id"], name: "index_categgories_with_subjects_on_subject_id", using: :btree
  add_index "categgories_with_subjects", ["user_id"], name: "index_categgories_with_subjects_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text    "text"
    t.integer "test_setting_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_settings", force: :cascade do |t|
    t.integer  "max_tried_count", default: 0
    t.text     "description"
    t.integer  "theme_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name"
    t.integer  "categgory_id"
    t.integer  "subject_id"
    t.integer  "time_to_pass",    default: 0
    t.json     "files"
    t.json     "videos"
    t.integer  "user_id"
  end

  add_index "test_settings", ["categgory_id"], name: "index_test_settings_on_categgory_id", using: :btree
  add_index "test_settings", ["subject_id"], name: "index_test_settings_on_subject_id", using: :btree
  add_index "test_settings", ["user_id"], name: "index_test_settings_on_user_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "test_setting_id"
    t.integer  "user_id"
    t.integer  "complete_pers"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tidings", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "main"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json     "photos"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "authentication_token"
    t.integer  "categgory_id"
    t.string   "avatar"
    t.integer  "subject_id"
    t.string   "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subject_id"], name: "index_users_on_subject_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "answers", "tests"
  add_foreign_key "comments", "users"
  add_foreign_key "test_settings", "users"
  add_foreign_key "users", "subjects"
end
