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

ActiveRecord::Schema.define(version: 20140505081749) do

  create_table "answers", force: true do |t|
    t.integer  "givenanswer"
    t.boolean  "answercorrect"
    t.boolean  "hintsemanticused"
    t.boolean  "hintsentenceused"
    t.boolean  "hintimageused"
    t.integer  "xp"
    t.datetime "questionstarted"
    t.datetime "questionfinished"
    t.integer  "playtime"
    t.integer  "level"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "levels", force: true do |t|
    t.integer  "number"
    t.datetime "openingdate"
    t.datetime "closingdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "word"
    t.text     "ans1"
    t.text     "ans2"
    t.text     "ans3"
    t.text     "ans4"
    t.text     "hintsemantic"
    t.text     "hintsentence"
    t.string   "hintimage"
    t.integer  "anscorrect"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["level_id"], name: "index_questions_on_level_id"

  create_table "users", force: true do |t|
    t.string   "acro"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xp",            default: 0
    t.string   "avatar",        default: "default"
    t.string   "name"
    t.string   "klas",          default: "4b"
  end

end
