module Api
  module V1
    class FoodsController < ApplicationController
      def index
        foods = Food.where(food_category_id: params[:food_category_id])
        render json: foods
      end

      def show
      end
    end
  end
end
