require 'rails_helper'

RSpec.describe "Authentications", type: :system do
  describe "ログイン" do
    let(:user) { create(:user) }

    before do
      visit "/"
      # リンク名は後々修正
      click_link "to login"
    end

    context "フォームの入力値が有効" do
      it "ログインに成功すること" do
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect(page).to have_content "ログインしました"
      end
    end

    context "フォームの入力値が無効" do
      it "メールアドレスが未入力の場合、ログインに失敗すること" do
        fill_in "メールアドレス", with: ""
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect(page).to have_content "メールアドレスを入力してください"
      end

      it "メールアドレスが間違っている場合、ログインに失敗すること" do
        fill_in "メールアドレス", with: "unmatch"
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect(page).to have_content ""
      end

      it "パスワードが未入力の場合、ログインに失敗すること" do
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: ""
        click_button "ログイン"

        expect(page).to have_content "パスワードを入力してください"
      end

      it "パスワードが間違っている場合、ログインに失敗すること" do
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "unmatch"
        click_button "ログイン"

        expect(page).to have_content ""
      end
    end
  end

  describe "ログアウト" do
    context "ログアウトボタンをクリック" do
      it "ログアウト処理が成功する"
    end
  end
end
