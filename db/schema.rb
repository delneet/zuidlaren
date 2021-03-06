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

ActiveRecord::Schema.define(version: 20171013114401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "action"
    t.integer  "event_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_group_id"], name: "index_events_on_event_group_id", using: :btree
  end

  create_table "events_repositories", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "repository_id"
    t.index ["event_id"], name: "index_events_repositories_on_event_id", using: :btree
    t.index ["repository_id"], name: "index_events_repositories_on_repository_id", using: :btree
  end

  create_table "events_teams", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "team_id"
    t.index ["event_id"], name: "index_events_teams_on_event_id", using: :btree
    t.index ["team_id"], name: "index_events_teams_on_team_id", using: :btree
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories_users", id: false, force: :cascade do |t|
    t.integer "repository_id"
    t.integer "user_id"
    t.index ["repository_id"], name: "index_repositories_users_on_repository_id", using: :btree
    t.index ["user_id"], name: "index_repositories_users_on_user_id", using: :btree
  end

  create_table "sounds", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "sound_file_name"
    t.string   "sound_content_type"
    t.integer  "sound_file_size"
    t.datetime "sound_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "slack_channel"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "teams_events", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_teams_events_on_event_id", using: :btree
    t.index ["team_id"], name: "index_teams_events_on_team_id", using: :btree
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_teams_users_on_team_id", using: :btree
    t.index ["user_id"], name: "index_teams_users_on_user_id", using: :btree
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.boolean  "completed"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_todos_on_team_id", using: :btree
    t.index ["user_id"], name: "index_todos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "github_username"
    t.string   "slack_username"
    t.integer  "team_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

end
