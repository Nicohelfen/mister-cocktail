ActiveRecord::Schema.define(version: 20151015095154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktails", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doses", force: :cascade do |t|
    t.string   "description"
    t.integer  "cocktail_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "doses", ["cocktail_id"], name: "index_doses_on_cocktail_id", using: :btree
  add_index "doses", ["ingredient_id"], name: "index_doses_on_ingredient_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "doses", "cocktails"
  add_foreign_key "doses", "ingredients"
end
