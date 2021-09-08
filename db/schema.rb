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

ActiveRecord::Schema.define(version: 2021_09_08_082708) do

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
    t.integer "gender", null: false
    t.integer "age_top", null: false
    t.integer "age_bottom", null: false
    t.float "vitamin_a", null: false
    t.float "upper_limit_vitamin_a", null: false
    t.float "vitamin_d", null: false
    t.float "upper_limit_vitamin_d", null: false
    t.float "vitamin_e", null: false
    t.float "upper_limit_vitamin_e", null: false
    t.float "vitamin_k", null: false
    t.float "vitamin_b1", null: false
    t.float "vitamin_b2", null: false
    t.float "niacin", null: false
    t.float "upper_limit_niacin", null: false
    t.float "vitamin_b6", null: false
    t.float "upper_limit_vitamin_b6", null: false
    t.float "vitamin_b12", null: false
    t.float "folate", null: false
    t.float "upper_limit_folate", null: false
    t.float "pantothenic_acid", null: false
    t.float "biotin", null: false
    t.float "vitamin_c", null: false
    t.float "potassium", null: false
    t.float "calcium", null: false
    t.float "upper_limit_calcium", null: false
    t.float "magnesium", null: false
    t.float "phosphorus", null: false
    t.float "upper_limit_phosphorus", null: false
    t.float "iron", null: false
    t.float "upper_limit_iron", null: false
    t.float "zinc", null: false
    t.float "upper_limit_zinc", null: false
    t.float "copper", null: false
    t.float "upper_limit_copper", null: false
    t.float "manganese", null: false
    t.float "upper_limit_manganese", null: false
    t.float "iodine", null: false
    t.float "upper_limit_iodine", null: false
    t.float "selenium", null: false
    t.float "upper_limit_selenium", null: false
    t.float "chromium", null: false
    t.float "upper_limit_chromium", null: false
    t.float "molybdenum", null: false
    t.float "upper_limit_molybdenum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "users", "dietary_reference_intakes"
end
