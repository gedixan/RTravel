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

ActiveRecord::Schema.define(version: 20171209020832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_users", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_area_users_on_area_id", using: :btree
    t.index ["user_id"], name: "index_area_users_on_user_id", using: :btree
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "color",      default: "#74847d"
    t.boolean  "status",     default: true,      null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "buses", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "num_policy",                  null: false
    t.boolean  "status",      default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description"
    t.boolean  "locked",      default: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "name",                                                null: false
    t.decimal  "amount",     precision: 12, scale: 4, default: "0.0"
    t.boolean  "status",                              default: false
    t.integer  "travel_id"
    t.datetime "payment_at",                                          null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["travel_id"], name: "index_payments_on_travel_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "fname",      null: false
    t.string   "lname",      null: false
    t.string   "document"
    t.date     "birthday"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",                          null: false
    t.boolean  "is_base",       default: false
    t.boolean  "is_agent",      default: false
    t.boolean  "is_supervisor", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "seatings", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "status",     default: true
    t.integer  "bus_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["bus_id"], name: "index_seatings_on_bus_id", using: :btree
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "code",                      null: false
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "status_users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "name",                                                     null: false
    t.integer  "user_id"
    t.integer  "person_id"
    t.integer  "travel_id"
    t.decimal  "amount_paid",      precision: 8, scale: 2, default: "0.0"
    t.datetime "regristration_at",                                         null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["person_id"], name: "index_tickets_on_person_id", using: :btree
    t.index ["travel_id"], name: "index_tickets_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "travel_routes", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "starting_point",                null: false
    t.string   "arrival_point",                 null: false
    t.boolean  "status",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "travels", force: :cascade do |t|
    t.string   "name",            null: false
    t.integer  "person_id"
    t.integer  "bus_id"
    t.integer  "travel_route_id"
    t.datetime "starting_at"
    t.datetime "arrival_at"
    t.integer  "service_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bus_id"], name: "index_travels_on_bus_id", using: :btree
    t.index ["person_id"], name: "index_travels_on_person_id", using: :btree
    t.index ["service_type_id"], name: "index_travels_on_service_type_id", using: :btree
    t.index ["travel_route_id"], name: "index_travels_on_travel_route_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "fname",                               null: false
    t.string   "lname",                               null: false
    t.string   "document"
    t.string   "phone"
    t.string   "jobtitle"
    t.string   "photo"
    t.string   "username",                            null: false
    t.integer  "role_id",                             null: false
    t.integer  "status_user_id",                      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "area_users", "areas"
  add_foreign_key "area_users", "users"
  add_foreign_key "payments", "travels"
  add_foreign_key "seatings", "buses"
  add_foreign_key "tickets", "people"
  add_foreign_key "tickets", "travels"
  add_foreign_key "tickets", "users"
  add_foreign_key "travels", "buses"
  add_foreign_key "travels", "people"
  add_foreign_key "travels", "service_types"
  add_foreign_key "travels", "travel_routes"
end
