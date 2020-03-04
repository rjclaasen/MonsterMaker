# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_04_153021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.bigint "monster_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monster_id"], name: "index_actions_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "hitPointsAndDice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "armorClass"
    t.string "speed"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.string "skills"
    t.string "damageImmunities"
    t.string "conditionImmunities"
    t.string "senses"
    t.string "languages"
    t.string "challenge"
    t.json "traits", array: true
    t.json "actions", array: true
    t.string "savingThrows"
    t.string "damageVulnerabilities"
    t.string "damageResistances"
    t.string "size"
    t.string "type"
    t.string "alignment"
    t.string "armorSource"
    t.index ["created_at"], name: "index_monsters_on_created_at"
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "monster_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monster_id"], name: "index_reactions_on_monster_id"
  end

  create_table "traits", force: :cascade do |t|
    t.bigint "monster_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monster_id"], name: "index_traits_on_monster_id"
  end

end
