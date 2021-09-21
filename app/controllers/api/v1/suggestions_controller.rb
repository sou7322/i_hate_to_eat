module Api
  module V1
    class SuggestionsController < BaseController
      before_action :set_user

      def show
        set_data(@user)

        get_intake_total(@foods)
        total_params = @total.attributes
        get_achievement(total_params, @bmr, @dri, @pfc)

        render json: { meals: @foods, total: @total, achv: @achv }
      end

      def update; end

      def destroy; end

      private

        def set_user
          @user = User.find(current_user.id)
        end

        def set_data(user)
          @bmr = user.bmr
          @dri = user.dietary_reference_intake
          @foods = user.suggested_foods
          @pfc = user.set_amount_pfc
        end

        def get_intake_total(foods)
          @total = TotalNutrition.new
          @total.calc_intake_total(foods)
        end

        def get_achievement(total, bmr, dri, pfc)
          @achv = IntakeAchievement.new
          @achv.calc_intake_achievement(total, bmr, dri, pfc)
        end
    end
  end
end
