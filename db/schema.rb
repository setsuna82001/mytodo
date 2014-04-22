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

ActiveRecord::Schema.define(version: 20140421082117) do

  create_table "genrelists", force: true do |t|
    t.string   "name",    default: "", null: false
    t.datetime "updated",              null: false
  end

  add_index "genrelists", ["id", "name"], name: "key01", unique: true, using: :btree
  add_index "genrelists", ["id", "updated"], name: "key02", using: :btree

  create_table "tasklists", force: true do |t|
    t.string   "name",     default: "", null: false
    t.integer  "genre_id", default: 0,  null: false
    t.string   "detail",   default: "", null: false
    t.integer  "progress", default: 0,  null: false
    t.integer  "sortnum",  default: 0,  null: false
    t.datetime "updated",               null: false
  end

  add_index "tasklists", ["id", "name"], name: "key01", unique: true, using: :btree
  add_index "tasklists", ["id", "updated"], name: "key02", using: :btree
  add_index "tasklists", ["progress"], name: "key03", using: :btree

end
