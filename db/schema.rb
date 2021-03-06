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

ActiveRecord::Schema.define(version: 2021_02_05_191045) do

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "primary_type"
    t.string "secondary_type"
    t.string "nature"
    t.string "ability"
    t.string "avatar"
    t.string "sprite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemonteams", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemonteams_on_pokemon_id"
    t.index ["team_id"], name: "index_pokemonteams_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_teams_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
