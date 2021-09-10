require 'rails_helper'

RSpec.describe "Registers", type: :system, js: true do
  describe "ユーザー新規登録" do
    before do
      create(:dietary_reference_intake, :f_u29)
      create(:dietary_reference_intake, :f_u49)
      create(:dietary_reference_intake, :f_u64)
      create(:dietary_reference_intake, :m_u29)
      create(:dietary_reference_intake, :m_u49)
      create(:dietary_reference_intake, :m_u64)

      visit "/"
      # TODO: フッターのボタンを押せるように
      click_link "register"
    end

    context "フォームの入力値が有効" do
      fit "ユーザーの新規作成が成功すること" do
        fill_in "ユーザーネーム", with: "test_user"
        fill_in "メールアドレス", with: "test_user@example.com"
        choose "女性"
        fill_in "生年月日", with: "1995-03-22"
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: "12345"
        click_button "登録"

        expect(page).to have_content "登録が完了しました"
      end
    end

    context "フォームの入力値が無効" do
      it "ユーザーネームが未入力の場合、新規作成が失敗すること" do
        fill_in "ユーザーネーム", with: ""
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: "12345"
        click_button "登録"

        expect(page).to have_content "ユーザーネームを入力してください"
      end

      it "メールアドレスが未入力の場合、新規作成が失敗すること" do
        fill_in "ユーザーネーム", with: "test_user"
        fill_in "メールアドレス", with: ""
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: "12345"
        click_button "登録"

        expect(page).to have_content "メールアドレスを入力してください"
      end

      it "登録済みのメールアドレスを入力した場合、新規作成が失敗すること" do
        other_user = create(:user)

        fill_in "ユーザーネーム", with: "test_user"
        fill_in "メールアドレス", with: other_user.email
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: "12345"
        click_button "登録"

        expect(page).to have_content "メールアドレスはすでに存在します"
      end

      context "パスワードが5文字以下の場合" do
        it "パスワードが未入力の場合、新規作成が失敗すること" do
          fill_in "ユーザーネーム", with: "test_user"
          fill_in "メールアドレス", with: "test_user@example.com"
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認）", with: "12345"
          click_button "登録"

          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "パスワードと一致しません"
        end

        it "パスワードが4文字の場合、新規作成が失敗すること" do
          fill_in "ユーザーネーム", with: "test_user"
          fill_in "メールアドレス", with: "test_user@example.com"
          fill_in "パスワード", with: "1234"
          fill_in "パスワード（確認）", with: "1234"
          click_button "登録"

          expect(page).to have_content "パスワードは5文字以上で入力してください"
        end
      end

      it "パスワードとパスワード（確認）入力値が異なる場合、新規作成が失敗すること" do
        fill_in "ユーザーネーム", with: "test_user"
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: "unmatch"
        click_button "登録"

        expect(page).to have_content "パスワードと一致しません"
      end

      it "パスワード（確認）が未入力の場合、新規作成が失敗すること" do
        fill_in "ユーザーネーム", with: "test_user"
        fill_in "メールアドレス", with: "test_user@example.com"
        fill_in "パスワード", with: "12345"
        fill_in "パスワード（確認）", with: ""
        click_button "登録"

        expect(page).to have_content "パスワード（確認）を入力してください"
      end
    end
  end
end
