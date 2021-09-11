class FoodCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
