require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    context "有効な属性値の場合" do
      fit "名前、メールアドレス、パスワード、パスワード（確認）があればvalidであること" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty

        expect(user.role).to eq 'general'
        expect(user.gender).to eq 'female'
        expect(user.height).to eq 0
        expect(user.weight).to eq 0.0
        expect(user.bmr).to eq 0.0
      end

      it "パスワードが5文字の場合、validであること" do
        user = build(:user, password: "12345",
                            password_confirmation: "12345")
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end

      it "身長の値が整数値の場合、validであること" do
        user = create(:user)
        user.height = 160
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end

      it "体重の値が数値の場合、validであること" do
        user = create(:user)
        user.weight = 50.0
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end

      it "bmrの値が数値の場合、validであること" do
        user = create(:user)
        user.bmr = 1600.0
        user.valid?
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end

      it "現在18歳になる生年月日の場合、validであること" do
        user_18years = create(:user)
        dt = Time.current.ago(18.years)

        user_18years.birth = dt
        user_18years.valid?
        expect(user_18years).to be_valid
        expect(user_18years.errors).to be_empty
      end

      it "現在59歳になる生年月日の場合、validであること" do
        user_59years = create(:user)
        dt = Time.current.ago(59.years)

        user_59years.birth = dt
        user_59years.valid?
        expect(user_59years).to be_valid
        expect(user_59years.errors).to be_empty
      end
    end

    context "無効な属性値の場合" do
      it "名前がなければ、invalidになること" do
        user_without_name = build(:user, name: "")
        user_without_name.valid?
        expect(user_without_name).to be_invalid
        expect(user_without_name.errors[:name]).to include "を入力してください"
      end

      it "メールアドレスがなければ、invalidになること" do
        user_without_email = build(:user, email: "")
        user_without_email.valid?
        expect(user_without_email).to be_invalid
        expect(user_without_email.errors[:email]).to include "を入力してください"
      end

      it "重複したメールアドレスの場合、invalidになること" do
        other_user = create(:user)
        user_duplicate_email = build(:user, email: other_user.email)
        expect(user_duplicate_email).to be_invalid
        expect(user_duplicate_email.errors[:email]).to include "はすでに存在します"
      end

      context "パスワードが5文字以下の場合" do
        it "0文字の場合、invalidになること" do
          user_without_password = build(:user, password: "")
          user_without_password.valid?
          expect(user_without_password).to be_invalid
          expect(user_without_password.errors[:password]).to include "は5文字以上で入力してください"
        end

        it "4文字の場合、invalidになること" do
          user_without_password = build(:user, password: "1234")
          user_without_password.valid?
          expect(user_without_password).to be_invalid
          expect(user_without_password.errors[:password]).to include "は5文字以上で入力してください"
        end
      end

      it "パスワードとパスワード（確認）の値が異なる場合、invalidになること" do
        user_with_unmatch_password = build(:user, password: "password",
                                                  password_confirmation: "unmatch")
        user_with_unmatch_password.valid?
        expect(user_with_unmatch_password).to be_invalid
        expect(user_with_unmatch_password.errors[:password_confirmation]).to include "とパスワードの入力が一致しません"
      end

      it "パスワード（確認）がなければ、invalidになること" do
        user_without_password_confirmation = build(:user, password_confirmation: "")
        user_without_password_confirmation.valid?
        expect(user_without_password_confirmation).to be_invalid
        expect(user_without_password_confirmation.errors[:password_confirmation]).to include "を入力してください"
      end

      it "身長の値が数値でない場合、invalidになること" do
        user_with_string = create(:user)
        user_with_string.height = "string"
        user_with_string.valid?
        expect(user_with_string).to be_invalid
        expect(user_with_string.errors[:height]).to include "は数値で入力してください"
      end

      it "身長の値が少数の場合、invalidになること" do
        user_with_decimals = create(:user)
        user_with_decimals.height = 160.0
        user_with_decimals.valid?
        expect(user_with_decimals).to be_invalid
        expect(user_with_decimals.errors[:height]).to include "は整数で入力してください"
      end

      it "体重の値が数値でない場合、invalidになること" do
        user_with_string = create(:user)
        user_with_string.weight = "string"
        user_with_string.valid?
        expect(user_with_string).to be_invalid
        expect(user_with_string.errors[:weight]).to include "は数値で入力してください"
      end

      it "bmrの値が数値でない場合、invalidになること" do
        user_with_string = create(:user)
        user_with_string.bmr = "string"
        user_with_string.valid?
        expect(user_with_string).to be_invalid
        expect(user_with_string.errors[:bmr]).to include "は数値で入力してください"
      end

      it "生年月日の値が未来の日付の場合、invalidになること" do
        user_with_future_date = create(:user)
        dt = Time.current.since(1.day)

        user_with_future_date.birth = dt
        user_with_future_date.valid?
        expect(user_with_future_date).to be_invalid
        expect(user_with_future_date.errors[:birth]).to include "未来の日付は入力できません"
      end

      it "現在17歳になる生年月日の場合、invalidになること" do
        user_under17 = create(:user)
        dt = Time.current.ago(17.years)

        user_under17.birth = dt
        user_under17.valid?
        expect(user_under17).to be_invalid
        expect(user_under17.errors[:birth]).to include "本サービスは18歳以上60歳未満の方が対象です"
      end

      it "現在60歳になる生年月日の場合、invalidになること" do
        user_over60 = create(:user)
        dt = Time.current.ago(60.years)

        user_over60.birth = dt
        user_over60.valid?
        expect(user_over60).to be_invalid
        expect(user_over60.errors[:birth]).to include "本サービスは18歳以上60歳未満の方が対象です"
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  birth                   :date
#  bmr                     :float(24)        default(0.0), not null
#  crypted_password        :string(255)
#  email                   :string(255)      not null
#  gender                  :integer          default("female"), not null
#  height                  :integer          default(0), not null
#  name                    :string(255)      not null
#  percentage_carbohydrate :float(24)        default(0.6), not null
#  percentage_fat          :float(24)        default(0.2), not null
#  percentage_protein      :float(24)        default(0.2), not null
#  role                    :integer          default("general"), not null
#  salt                    :string(255)
#  weight                  :float(24)        default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
