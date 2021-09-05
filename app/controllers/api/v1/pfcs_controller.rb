module Api
  module V1
    class PfcsController < ApplicationController
      before_action :set_user

      def show
        set_attributes_for_pfc(@user)
        json_string = @data_of_pfc.to_json
        render json: json_string
      end

      def update; end

      private

      def set_user
        @user = User.find(current_user.id)
      end

      def user_params
        params.require(:user).permit(:percentage_protein,
                                     :percentage_fat,
                                     :percentage_carbohydrate)
      end

      def set_attributes_for_pfc(user)
        @data_of_pfc = {
          pct: user.set_percentage.map,
          amount: user.set_amount_pfc
        }
      end
    end
  end
end
