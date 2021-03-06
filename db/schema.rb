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

ActiveRecord::Schema.define(version: 2021_09_21_104523) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "dietary_reference_intakes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "gender", default: 0, null: false
    t.integer "age_top", default: 0, null: false
    t.integer "age_bottom", default: 0, null: false
    t.float "vitamin_a", default: 0.0, null: false
    t.float "upper_limit_vitamin_a", default: 0.0, null: false
    t.float "vitamin_d", default: 0.0, null: false
    t.float "upper_limit_vitamin_d", default: 0.0, null: false
    t.float "vitamin_e", default: 0.0, null: false
    t.float "upper_limit_vitamin_e", default: 0.0, null: false
    t.float "vitamin_k", default: 0.0, null: false
    t.float "vitamin_b1", default: 0.0, null: false
    t.float "vitamin_b2", default: 0.0, null: false
    t.float "niacin", default: 0.0, null: false
    t.float "upper_limit_niacin", default: 0.0, null: false
    t.float "vitamin_b6", default: 0.0, null: false
    t.float "upper_limit_vitamin_b6", default: 0.0, null: false
    t.float "vitamin_b12", default: 0.0, null: false
    t.float "folate", default: 0.0, null: false
    t.float "upper_limit_folate", default: 0.0, null: false
    t.float "pantothenic_acid", default: 0.0, null: false
    t.float "biotin", default: 0.0, null: false
    t.float "vitamin_c", default: 0.0, null: false
    t.float "potassium", default: 0.0, null: false
    t.float "calcium", default: 0.0, null: false
    t.float "upper_limit_calcium", default: 0.0, null: false
    t.float "magnesium", default: 0.0, null: false
    t.float "phosphorus", default: 0.0, null: false
    t.float "upper_limit_phosphorus", default: 0.0, null: false
    t.float "iron", default: 0.0, null: false
    t.float "upper_limit_iron", default: 0.0, null: false
    t.float "zinc", default: 0.0, null: false
    t.float "upper_limit_zinc", default: 0.0, null: false
    t.float "copper", default: 0.0, null: false
    t.float "upper_limit_copper", default: 0.0, null: false
    t.float "manganese", default: 0.0, null: false
    t.float "upper_limit_manganese", default: 0.0, null: false
    t.float "iodine", default: 0.0, null: false
    t.float "upper_limit_iodine", default: 0.0, null: false
    t.float "selenium", default: 0.0, null: false
    t.float "upper_limit_selenium", default: 0.0, null: false
    t.float "chromium", default: 0.0, null: false
    t.float "upper_limit_chromium", default: 0.0, null: false
    t.float "molybdenum", default: 0.0, null: false
    t.float "upper_limit_molybdenum", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", default: "dummy", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_food_categories_on_name", unique: true
  end

  create_table "foods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "food_category_id"
    t.string "name", default: "dummy", null: false
    t.float "reference_amount", default: 1.0, null: false
    t.text "description"
    t.integer "priority", default: 0, null: false
    t.float "calorie", default: 0.0, null: false
    t.float "protein", default: 0.0, null: false
    t.float "fat", default: 0.0, null: false
    t.float "carbohydrate", default: 0.0, null: false
    t.float "vitamin_a", default: 0.0, null: false
    t.float "vitamin_d", default: 0.0, null: false
    t.float "vitamin_e", default: 0.0, null: false
    t.float "vitamin_k", default: 0.0, null: false
    t.float "vitamin_b1", default: 0.0, null: false
    t.float "vitamin_b2", default: 0.0, null: false
    t.float "niacin", default: 0.0, null: false
    t.float "vitamin_b6", default: 0.0, null: false
    t.float "vitamin_b12", default: 0.0, null: false
    t.float "folate", default: 0.0, null: false
    t.float "pantothenic_acid", default: 0.0, null: false
    t.float "biotin", default: 0.0, null: false
    t.float "vitamin_c", default: 0.0, null: false
    t.float "potassium", default: 0.0, null: false
    t.float "calcium", default: 0.0, null: false
    t.float "magnesium", default: 0.0, null: false
    t.float "phosphorus", default: 0.0, null: false
    t.float "iron", default: 0.0, null: false
    t.float "zinc", default: 0.0, null: false
    t.float "copper", default: 0.0, null: false
    t.float "manganese", default: 0.0, null: false
    t.float "iodine", default: 0.0, null: false
    t.float "selenium", default: 0.0, null: false
    t.float "chromium", default: 0.0, null: false
    t.float "molybdenum", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subname"
    t.index ["food_category_id"], name: "index_foods_on_food_category_id"
  end

  create_table "suggestions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "food_id", null: false
    t.float "amount", default: 1.0, null: false
    t.date "target_date", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_suggestions_on_food_id"
    t.index ["user_id", "food_id", "target_date"], name: "index_suggestions_on_user_id_and_food_id_and_target_date", unique: true
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gender", default: 0, null: false
    t.date "birth"
    t.integer "height", default: 0, null: false
    t.float "weight", default: 0.0, null: false
    t.float "bmr", default: 0.0, null: false
    t.float "percentage_protein", default: 0.2, null: false
    t.float "percentage_fat", default: 0.2, null: false
    t.float "percentage_carbohydrate", default: 0.6, null: false
    t.bigint "dietary_reference_intake_id"
    t.index ["dietary_reference_intake_id"], name: "index_users_on_dietary_reference_intake_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "foods", "food_categories"
  add_foreign_key "suggestions", "foods"
  add_foreign_key "suggestions", "users"
  add_foreign_key "users", "dietary_reference_intakes"
end
