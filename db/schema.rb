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

ActiveRecord::Schema.define(version: 2021_08_24_114810) do

  create_table "comments", force: :cascade do |t|
    t.text "comment_body"
    t.integer "phase_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phase_id"], name: "index_comments_on_phase_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "project_name"
    t.string "client_name"
    t.text "client_address"
    t.string "client_email"
    t.string "client_contact"
    t.string "platform"
    t.string "status"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "phase_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "phase_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phase_id"], name: "index_phase_assignments_on_phase_id"
    t.index ["user_id"], name: "index_phase_assignments_on_user_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "phase_type"
    t.datetime "start_date"
    t.datetime "due_date"
    t.string "phase_status"
    t.integer "lead_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_phases_on_lead_id"
  end

  create_table "project_leads", force: :cascade do |t|
    t.string "project_name"
    t.integer "lead_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lead_id"], name: "index_project_leads_on_lead_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_name"], name: "index_roles_on_role_name"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "phases"
  add_foreign_key "comments", "users"
  add_foreign_key "leads", "users"
  add_foreign_key "phase_assignments", "phases"
  add_foreign_key "phase_assignments", "users"
  add_foreign_key "phases", "leads"
  add_foreign_key "project_leads", "leads"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end