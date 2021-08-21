require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET /create" do
    context "有効な属性値の場合" do
      it "ユーザーを追加できること" do
        valid_params = attributes_for(:user)

        expect {
          post "/api/v1/registration", params: { user: valid_params }
        }.to change(User, :count).by(1)
        expect(response).to have_http_status("200")
      end
    end

    context "無効な属性値の場合" do
      it "名前がない場合ユーザーを追加できないこと" do
        without_name_params = attributes_for(:user, name: "")

        expect {
          post "/api/v1/registration", params: { user: without_name_params }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status("400")
      end

      it "メールアドレスがない場合ユーザーを追加できないこと" do
        without_email_params = attributes_for(:user, email: "")

        expect {
          post "/api/v1/registration", params: { user: without_email_params }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status("400")
      end

      it "重複したメールアドレスの場合ユーザーを追加できないこと" do
        other_user = create(:user)
        duplicate_email_params = attributes_for(:user, email: other_user.email)

        expect {
          post "/api/v1/registration", params: { user: duplicate_email_params }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status("400")
      end
    end
  end
end
