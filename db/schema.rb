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

ActiveRecord::Schema.define(version: 20180314065226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plugin_instances", force: :cascade do |t|
    t.string "version"
    t.string "path"
    t.boolean "published"
    t.bigint "plugin_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plugin_id"], name: "index_plugin_instances_on_plugin_id"
  end

  create_table "plugin_upgrades", force: :cascade do |t|
    t.string "ip"
    t.string "os"
    t.string "version"
    t.bigint "plugin_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plugin_instance_id"], name: "index_plugin_upgrades_on_plugin_instance_id"
  end

  create_table "plugins", force: :cascade do |t|
    t.string "name", null: false
    t.string "appid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_plugins_on_appid", unique: true
    t.index ["name"], name: "index_plugins_on_name", unique: true
  end

  create_table "user", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plugin_instances", "plugins"
  add_foreign_key "plugin_upgrades", "plugin_instances"
end
