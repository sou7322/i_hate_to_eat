module Api
  module V1
    class UsersDietaryReferencesController < BaseController
      include Api::DietaryReferenceIntakesHandler
      before_action :set_user

      def show
        dri = @user.dietary_reference_intake
        json_string = DietaryReferenceIntakeSerializer
                      .new(dri)
                      .serialized_json
        render json: json_string
      end

      def update
        dri = set_reference_intake(@user)
        dri_id = dri.id

        if @user.update(dietary_reference_intake_id: dri_id)
          json_string = DietaryReferenceIntakeSerializer
                        .new(@user.dietary_reference_intake)
                        .serialized_json
          render json: json_string
        else
          render400(nil, @user.errors.full_messages)
        end
      end

      private

        def set_user
          @user = User.find(current_user.id)
        end
    end
  end
end
