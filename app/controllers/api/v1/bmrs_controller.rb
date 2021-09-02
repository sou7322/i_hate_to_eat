module Api
  module V1
    class BmrsController < BaseController
      before_action :set_user

      def show
        attributes = set_attributes_for_bmr(@user).to_json
        render json: attributes
      end

      def update
        if @user.update(user_params)
          bmr = @user.calc_bmr.floor
          render json: { bmr: bmr } if @user.update(bmr: bmr)
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

        def set_attributes_for_bmr(user)
          @attributes_for_bmr = {
            user: {
              gender: user.gender,
              birth: user.birth,
              height: user.height,
              weight: user.weight,
              bmr: user.bmr
            }
          }
        end
    end
  end
end
