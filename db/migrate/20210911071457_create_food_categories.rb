class CreateFoodCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :food_categories do |t|
      t.string :name, null: false, default: "dummy"

      t.timestamps
      t.index :name, unique: true
    end
  end
end
