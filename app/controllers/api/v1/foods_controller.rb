module Api
  module V1
    class FoodsController < BaseController
      def index
        foods = Food.where(food_category_id: params[:food_category_id])
        render json: foods
      end

      def show
        food = Food.find_by(id: params[:id])
        json_string = FoodSerializer.new(food).serialized_json

        render json: json_string
      end
    end
  end
end
