module Api
  module V1
    class FoodCategoriesController < BaseController
      def index
        categories = FoodCategory.all
        json_string = FoodCategorySerializer.new(categories).serialized_json

        render json: json_string
      end
    end
  end
end
