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

ActiveRecord::Schema.define(version: 20160212043056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enablements", force: :cascade do |t|
    t.integer "project_id"
    t.integer "resource_id"
  end

  add_index "enablements", ["project_id"], name: "index_enablements_on_project_id", using: :btree
  add_index "enablements", ["resource_id"], name: "index_enablements_on_resource_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date_projected"
    t.datetime "end_date_actual"
    t.decimal  "budget",             precision: 9, scale: 2
    t.decimal  "cost",               precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "due_date"
    t.string   "status"
    t.integer  "project_id"
    t.integer  "projects_id"
    t.integer  "user_id"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["projects_id"], name: "index_tasks_on_projects_id", using: :btree
  add_index "tasks", ["users_id"], name: "index_tasks_on_users_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "role"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "enablements", "projects"
  add_foreign_key "enablements", "resources"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users"
end
