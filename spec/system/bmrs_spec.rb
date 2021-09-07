require 'rails_helper'

RSpec.describe "Bmrs", type: :system do
  let(:user) { create(:user) }

  describe "BMR設定" do
    before do
      login_as(user)
      click_on "Mypage"
    end

    # TODO: システムスペックを作成
    context "フォームの入力値が有効" do
      context "性別を選択" do
        fit "女性を選択した場合、設定に成功すること"
        it "男性を選択した場合、設定に成功すること"
      end

      context "生年月日が有効範囲内" do
        it "現在18歳になる生年月日の場合、設定に成功すること"
        it "現在59歳になる生年月日の場合、設定に成功すること"
      end
    end

    context "フォームの入力値が無効" do
      context "生年月日の入力値が無効" do
        it "現在17歳になる生年月日の場合、設定に失敗すること"
        it "現在60歳になる生年月日の場合、設定に失敗すること"
      end

      context "身長の入力値が無効" do
        it "値が未入力の場合、設定に失敗すること"
        it "入力値が数値でない場合、設定に失敗すること"
      end

      context "体重の入力値が無効" do
        it "値が未入力の場合、設定に失敗すること"
        it "入力値が数値でない場合、設定に失敗すること"
      end
    end
  end
end
