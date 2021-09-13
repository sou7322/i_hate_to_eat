FactoryBot.define do
  factory :food_category do
    sequence(:name, "category_0")
    association :foods
  end
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
