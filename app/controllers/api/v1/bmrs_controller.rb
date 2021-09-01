module Api
  module V1
    class BmrsController < BaseController
      before_action :set_user

      def show
        json_string = UserSerializer.new(@user).serialized_json
        render json: json_string
      end

      def update
        if @user.update(user_params)
          bmr = calc_bmr
          render json: { bmr: bmr }
        else
          render400(nil, user.errors.full_messages)
        end
      end

      private

        def set_user
          @user = User.find(current_user.id)
        end

        def user_params
          params.require(:user).permit(:gender, :birth, :height, :weight)
        end
    end
  end
end
