module Api
  module V1
    class AuthenticationsController < BaseController
      def create
        @user = login(login_params[:email], login_params[:password])

        if @user
          head :ok
        else
          render400(nil, "Bad Request")
        end
      end

      def destroy
        head :ok if logout
      end

      private

        def login_params
          login_params = params[:user]
        end
    end
  end
end
