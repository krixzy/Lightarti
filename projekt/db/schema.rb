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

ActiveRecord::Schema[8.0].define(version: 2026_06_16_132403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "artifacts", force: :cascade do |t|
    t.string "name"
    t.string "content_type"
    t.bigint "size"
    t.bigint "user_id", null: false
    t.bigint "folder_id", null: false
    t.string "storage_key"
    t.string "checksum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "original_filename"
    t.index ["folder_id"], name: "index_artifacts_on_folder_id"
    t.index ["user_id"], name: "index_artifacts_on_user_id"
  end

  create_table "folder_permissions", force: :cascade do |t|
    t.bigint "folder_id", null: false
    t.bigint "user_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_folder_permissions_on_folder_id"
    t.index ["user_id"], name: "index_folder_permissions_on_user_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_folders_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artifacts", "folders"
  add_foreign_key "artifacts", "users"
  add_foreign_key "folder_permissions", "folders"
  add_foreign_key "folder_permissions", "users"
  add_foreign_key "folders", "folders", column: "parent_id"
end
