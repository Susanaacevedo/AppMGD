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

ActiveRecord::Schema.define(version: 20191123152924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campagnas", force: :cascade do |t|
    t.string "nombre"
    t.bigint "pagos_id"
    t.bigint "meta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meta_id"], name: "index_campagnas_on_meta_id"
    t.index ["pagos_id"], name: "index_campagnas_on_pagos_id"
  end

  create_table "carros", force: :cascade do |t|
    t.integer "total"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "estado"
    t.index ["users_id"], name: "index_carros_on_users_id"
  end

  create_table "detcarros", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "carros_id"
    t.bigint "productos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "precio"
    t.index ["carros_id"], name: "index_detcarros_on_carros_id"
    t.index ["productos_id"], name: "index_detcarros_on_productos_id"
  end

  create_table "meta", force: :cascade do |t|
    t.string "descripcion"
    t.date "fecinicio"
    t.date "fecfin"
    t.integer "cantmeta"
    t.integer "faltameta"
    t.boolean "estado"
    t.bigint "pagos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pagos_id"], name: "index_meta_on_pagos_id"
  end

  create_table "pagos", force: :cascade do |t|
    t.date "fecpago"
    t.boolean "estado"
    t.integer "tipentrega"
    t.integer "cantotal"
    t.bigint "carros_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carros_id"], name: "index_pagos_on_carros_id"
  end

  create_table "productos", force: :cascade do |t|
    t.integer "codigo"
    t.string "nombre"
    t.integer "precio"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "telefono"
    t.string "direccion"
    t.string "rut"
    t.boolean "role"
    t.string "foto"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campagnas", "meta", column: "meta_id"
  add_foreign_key "campagnas", "pagos", column: "pagos_id"
  add_foreign_key "carros", "users", column: "users_id"
  add_foreign_key "detcarros", "carros", column: "carros_id"
  add_foreign_key "detcarros", "productos", column: "productos_id"
  add_foreign_key "meta", "pagos", column: "pagos_id"
  add_foreign_key "pagos", "carros", column: "carros_id"
end
