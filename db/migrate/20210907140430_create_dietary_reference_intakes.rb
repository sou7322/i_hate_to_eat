class CreateDietaryReferenceIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :dietary_reference_intakes do |t|
      t.integer :gender, null: false
      t.integer :age_top, null: false
      t.integer :age_bottom, null: false
      t.float :vitamin_a, null: false
      t.float :upper_limit_vitamin_a, null: false
      t.float :vitamin_d, null: false
      t.float :upper_limit_vitamin_d, null: false
      t.float :vitamin_e, null: false
      t.float :upper_limit_vitamin_e, null: false
      t.float :vitamin_k, null: false
      t.float :vitamin_b1, null: false
      t.float :vitamin_b2, null: false
      t.float :niacin, null: false
      t.float :upper_limit_niacin, null: false
      t.float :vitamin_b6, null: false
      t.float :upper_limit_vitamin_b6, null: false
      t.float :vitamin_b12, null: false
      t.float :folate, null: false
      t.float :upper_limit_folate, null: false
      t.float :pantothenic_acid, null: false
      t.float :biotin, null: false
      t.float :vitamin_c, null: false
      t.float :potassium, null: false
      t.float :calcium, null: false
      t.float :upper_limit_calcium, null: false
      t.float :magnesium, null: false
      t.float :phosphorus, null: false
      t.float :upper_limit_phosphorus, null: false
      t.float :iron, null: false
      t.float :upper_limit_iron, null: false
      t.float :zinc, null: false
      t.float :upper_limit_zinc, null: false
      t.float :copper, null: false
      t.float :upper_limit_copper, null: false
      t.float :manganese, null: false
      t.float :upper_limit_manganese, null: false
      t.float :iodine, null: false
      t.float :upper_limit_iodine, null: false
      t.float :selenium, null: false
      t.float :upper_limit_selenium, null: false
      t.float :chromium, null: false
      t.float :upper_limit_chromium, null: false
      t.float :molybdenum, null: false
      t.float :upper_limit_molybdenum, null: false

      t.timestamps
    end
  end
end
