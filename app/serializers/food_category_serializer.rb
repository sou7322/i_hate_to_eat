class FoodCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end

# == Schema Information
#
# Table name: food_categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default("dummy"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_food_categories_on_name  (name) UNIQUE
#
