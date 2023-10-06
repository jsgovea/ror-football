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

ActiveRecord::Schema[7.0].define(version: 2023_10_02_074455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "flag_emoji"
    t.string "capital"
    t.string "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "name"
    t.integer "current_year"
    t.datetime "current_date"
    t.bigint "team_id", null: false
    t.datetime "last_time_played"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_game_sessions_on_team_id"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "division"
    t.bigint "country_id", null: false
    t.integer "prestige"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_leagues_on_country_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id", null: false
    t.integer "prestige"
    t.string "home_color"
    t.string "away_color"
    t.integer "off_value"
    t.integer "mid_value"
    t.integer "def_value"
    t.string "abbrev"
    t.integer "budget"
    t.integer "overall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_sessions", "teams"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "leagues", "countries"
  add_foreign_key "teams", "leagues"
end
