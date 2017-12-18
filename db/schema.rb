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

ActiveRecord::Schema.define(version: 20171218041105) do

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quiz_response_id"
    t.integer  "choice_id"
    t.integer  "question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["quiz_response_id", "choice_id", "question_id"], name: "index_answers_on_quiz_response_id_and_choice_id_and_question_id", unique: true, using: :btree
    t.index ["quiz_response_id"], name: "index_answers_on_quiz_response_id", using: :btree
  end

  create_table "choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "question_id"
    t.string   "text"
    t.boolean  "correct",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["question_id"], name: "index_choices_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quiz_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree
  end

  create_table "quiz_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quiz_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_responses_on_quiz_id", using: :btree
    t.index ["user_id", "quiz_id"], name: "index_quiz_responses_on_user_id_and_quiz_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_quiz_responses_on_user_id", using: :btree
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
