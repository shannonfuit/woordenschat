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

ActiveRecord::Schema.define(version: 20140521174514) do

  create_table "achievements", force: true do |t|
    t.integer  "user_id"
    t.integer  "medal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "achievements", ["medal_id"], name: "index_achievements_on_medal_id"
  add_index "achievements", ["user_id"], name: "index_achievements_on_user_id"

  create_table "answers", force: true do |t|
    t.integer  "given_answer"
    t.boolean  "correct_answered"
    t.boolean  "used_semantic_hint", default: false
    t.boolean  "used_sentence_hint", default: false
    t.boolean  "used_image_hint",    default: false
    t.integer  "xp",                 default: 0
    t.integer  "seconds"
    t.integer  "level"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "round_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["round_id"], name: "index_answers_on_round_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "levels", force: true do |t|
    t.integer  "number"
    t.datetime "openingdate"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medals", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "xp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "level_number"
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

  create_table "rounds", force: true do |t|
    t.datetime "ended_at"
    t.integer  "seconds"
    t.integer  "stars",         default: 0
    t.integer  "level_id"
    t.integer  "user_id"
    t.integer  "count_correct", default: 0
    t.integer  "level_xp",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["level_id"], name: "index_rounds_on_level_id"
  add_index "rounds", ["user_id"], name: "index_rounds_on_user_id"

  create_table "users", force: true do |t|
    t.string   "acro"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xp",            default: 0
    t.string   "picture"
    t.string   "name"
    t.string   "klas",          default: "4b"
  end

end
