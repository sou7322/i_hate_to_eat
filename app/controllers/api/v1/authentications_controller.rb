module Api
  module V1
    class AuthenticationsController < BaseController
      skip_before_action :require_login

      def create
        @user = login(params[:user][:email], params[:user][:password])

        if @user
          render json: { id: @user.id }
        else
          render400(nil, "ログインに失敗しました")
        end
      end

      def destroy
        logout
        head :ok
      end
    end
  end
end
