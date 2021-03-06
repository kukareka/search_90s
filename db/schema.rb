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

ActiveRecord::Schema.define(version: 20171101113904) do

  create_table "document_terms", force: :cascade do |t|
    t.integer "document_id"
    t.integer "term_id"
    t.float "score"
    t.index ["document_id"], name: "index_document_terms_on_document_id"
    t.index ["term_id"], name: "index_document_terms_on_term_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "type"
    t.text "metadata"
  end

  create_table "terms", force: :cascade do |t|
    t.string "term"
    t.index ["term"], name: "index_terms_on_term", unique: true
  end

end
