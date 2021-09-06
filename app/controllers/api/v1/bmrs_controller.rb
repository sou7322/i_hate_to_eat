module Api
  module V1
    class BmrsController < BaseController
      before_action :set_user

      def show
        set_attributes_for_bmr(@user)
        json_string = @attributes_for_bmr.to_json
        render json: json_string
      end

      # TODO: 1アクションの中で2度updateしている、要リファクタリング
      def update
        if @user.update(user_params)
          bmr = @user.calc_bmr.floor
          render json: { bmr: bmr } if @user.update(bmr: bmr)
        else
          render400(nil, @user.errors.full_messages)
        end
      end

      private

        def set_user
          @user = User.find(current_user.id)
        end

        def user_params
          params.require(:user).permit(:gender, :birth, :height, :weight)
        end

        def set_attributes_for_bmr(user)
          @attributes_for_bmr = {
            gender: user.gender,
            birth: user.birth,
            height: user.height,
            weight: user.weight,
            bmr: user.bmr
          }
        end
    end
  end
end
