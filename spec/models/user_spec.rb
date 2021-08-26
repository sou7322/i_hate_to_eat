require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    context "有効な属性値の場合" do
      it "名前、メールアドレス、パスワード、パスワード（確認）があれば新規作成に成功すること" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
        expect(user.role).to eq 'general'
      end

      it "パスワードが5文字の場合、新規作成に成功すること" do
        user = build(:user, password: "12345",
                            password_confirmation: "12345")
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
    end

    context "無効な属性値の場合" do
      it "名前がなければ、新規作成に失敗すること" do
        user_without_name = build(:user, name: "")
        user_without_name.valid?
        expect(user_without_name).to be_invalid
        expect(user_without_name.errors[:name]).to include "を入力してください"
      end

      it "メールアドレスがなければ、新規作成に失敗すること" do
        user_without_email = build(:user, email: "")
        user_without_email.valid?
        expect(user_without_email).to be_invalid
        expect(user_without_email.errors[:email]).to include "を入力してください"
      end

      it "重複したメールアドレスの場合、新規作成に失敗すること" do
        other_user = create(:user)
        user_duplicate_email = build(:user, email: other_user.email)
        expect(user_duplicate_email).to be_invalid
        expect(user_duplicate_email.errors[:email]).to include "はすでに存在します"
      end

      context "パスワードが5文字以下の場合" do
        it "0文字の場合、新規作成に失敗すること" do
          user_without_password = build(:user, password: "")
          user_without_password.valid?
          expect(user_without_password).to be_invalid
          expect(user_without_password.errors[:password]).to include "は5文字以上で入力してください"
        end

        it "4文字の場合、新規作成に失敗すること" do
          user_without_password = build(:user, password: "1234")
          user_without_password.valid?
          expect(user_without_password).to be_invalid
          expect(user_without_password.errors[:password]).to include "は5文字以上で入力してください"
        end
      end

      it "パスワードとパスワード（確認）の値が異なる場合、新規作成に失敗すること" do
        user_with_unmatch_password = build(:user, password: "password",
                                                  password_confirmation: "unmatch")
        user_with_unmatch_password.valid?
        expect(user_with_unmatch_password).to be_invalid
        expect(user_with_unmatch_password.errors[:password_confirmation]).to include "とパスワードの入力が一致しません"
      end

      it "パスワード（確認）がなければ、新規作成に失敗すること" do
        user_without_password_confirmation = build(:user, password_confirmation: "")
        user_without_password_confirmation.valid?
        expect(user_without_password_confirmation).to be_invalid
        expect(user_without_password_confirmation.errors[:password_confirmation]).to include "を入力してください"
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  role             :integer          default("general"), not null
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
