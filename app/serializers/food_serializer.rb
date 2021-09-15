class FoodSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :subname, :description, :reference_amount,
             :protein, :fat, :carbohydrate,
             :biotin, :calcium, :chromium, :copper, :folate, :iodine,
             :iron, :magnesium, :manganese, :molybdenum, :niacin,
             :pantothenic_acid, :phosphorus, :potassium, :selenium,
             :vitamin_a, :vitamin_b1, :vitamin_b12, :vitamin_b2,
             :vitamin_b6, :vitamin_c, :vitamin_d, :vitamin_e,
             :vitamin_k, :zinc

  belongs_to :food_category
end

# == Schema Information
#
# Table name: foods
#
#  id               :bigint           not null, primary key
#  biotin           :float(24)        default(0.0), not null
#  calcium          :float(24)        default(0.0), not null
#  calorie          :float(24)        default(0.0), not null
#  carbohydrate     :float(24)        default(0.0), not null
#  chromium         :float(24)        default(0.0), not null
#  copper           :float(24)        default(0.0), not null
#  description      :text(65535)
#  fat              :float(24)        default(0.0), not null
#  folate           :float(24)        default(0.0), not null
#  iodine           :float(24)        default(0.0), not null
#  iron             :float(24)        default(0.0), not null
#  magnesium        :float(24)        default(0.0), not null
#  manganese        :float(24)        default(0.0), not null
#  molybdenum       :float(24)        default(0.0), not null
#  name             :string(255)      default("dummy"), not null
#  niacin           :float(24)        default(0.0), not null
#  pantothenic_acid :float(24)        default(0.0), not null
#  phosphorus       :float(24)        default(0.0), not null
#  potassium        :float(24)        default(0.0), not null
#  priority         :integer          default(0), not null
#  protein          :float(24)        default(0.0), not null
#  reference_amount :float(24)        default(1.0), not null
#  selenium         :float(24)        default(0.0), not null
#  subname          :string(255)
#  vitamin_a        :float(24)        default(0.0), not null
#  vitamin_b1       :float(24)        default(0.0), not null
#  vitamin_b12      :float(24)        default(0.0), not null
#  vitamin_b2       :float(24)        default(0.0), not null
#  vitamin_b6       :float(24)        default(0.0), not null
#  vitamin_c        :float(24)        default(0.0), not null
#  vitamin_d        :float(24)        default(0.0), not null
#  vitamin_e        :float(24)        default(0.0), not null
#  vitamin_k        :float(24)        default(0.0), not null
#  zinc             :float(24)        default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  food_category_id :bigint
#
# Indexes
#
#  index_foods_on_food_category_id  (food_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_category_id => food_categories.id)
#
