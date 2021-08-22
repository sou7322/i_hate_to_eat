require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /create" do
    context "有効な属性値の場合" do
      it "ユーザー新規作成に成功すること" do
        valid_params = attributes_for(:user)

        expect {
          post "/api/v1/registration", params: { user: valid_params }
        }.to change(User, :count).by(1)
        expect(response).to have_http_status("200")
      end
    end

    context "無効な属性値の場合" do
      context "ユーザーネームの値がない場合" do
        it "ユーザー新規作成に失敗すること" do
          without_name_params = attributes_for(:user, name: "")

          expect {
            post "/api/v1/registration", params: { user: without_name_params }
          }.to change(User, :count).by(0)
          expect(response).to have_http_status("400")
        end
      end

      context "メールアドレスの値がない場合" do
        it "ユーザー新規作成に失敗すること" do
          without_email_params = attributes_for(:user, email: "")

          expect {
            post "/api/v1/registration", params: { user: without_email_params }
          }.to change(User, :count).by(0)
          expect(response).to have_http_status("400")
        end
      end

      context "登録済みのメールアドレスを使用した場合" do
        it "ユーザー新規作成に失敗すること" do
          other_user = create(:user)
          duplicate_email_params = attributes_for(:user, email: other_user.email)

          expect {
            post "/api/v1/registration", params: { user: duplicate_email_params }
          }.to change(User, :count).by(0)
          expect(response).to have_http_status("400")
        end
      end

      context "パスワードの値がない場合" do
        it "ユーザー新規作成に失敗すること" do
          without_password_params = attributes_for(:user, password: "")

          expect {
            post "/api/v1/registration", params: { user: without_password_params }
          }.to change(User, :count).by(0)
          expect(response).to have_http_status("400")
        end
      end

      context "パスワード（確認）の値がない場合" do
        it "ユーザー新規作成に失敗すること" do
          without_password_confirmation_params = attributes_for(:user, password_confirmation: "")

          expect {
            post "/api/v1/registration", params: { user: without_password_confirmation_params }
          }.to change(User, :count).by(0)
          expect(response).to have_http_status("400")
        end
      end
    end
  end
end
