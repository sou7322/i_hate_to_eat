namespace :suggestions do
  desc "期限切れのsuggestionを削除"
  task destroy_expied_suggestions: :environment do
    Suggestion.transaction do
      Suggestion.where("expires_at < ?", Time.zone.today).find_each do |s|
        s.destroy!
      end
    end
  end

  desc "ユーザーごとに当日の食事内容を新規作成"
  task create_suggestion: :environment do
    rand = Rails.env.production? ? "RANDOM()" : "RAND()"

    # 食品の配列から合計カロリーを算出
    def sum_calories(foods)
      foods.inject(0) { |sum, food|
        sum + food.calorie * food.reference_amount
      }
    end

    User.find_each do |user|
      meal_menus = []

      # ・主菜・主食をそれぞれ1つずつ追加
      regular = Food.h_prio
      main = Food.m_prio.maindish.order(rand).limit(1)
      staple = Food.m_prio.staple_food.order(rand).limit(1)

      meal_menus.concat(regular, main, staple)

      # 合計カロリーがBMRに達するまで副菜を追加
      # TODO: 無理矢理な計数ループ、要リファクタリング
      bmr = user.bmr
      loop = 0
      while !@over_bmr && loop <= 50
        # 重複を避けてサイドメニューを1つずつ取得
        side = Food.where.not(id: meal_menus.map(&:id)).rm_prio.sidedish.order(rand).limit(1)
        meal_menus.concat(side)

        @over_bmr = sum_calories(meal_menus) > bmr
        loop += 1
      end

      # 確定したメニューの内容をSuggestionのインスタンスとして保存
      Suggestion.transaction do
        meal_menus.each do |m|
          item = user.suggestions.new(
            food_id: m.id,
            amount: m.reference_amount,
            target_date: Time.zone.today,
            expires_at: Time.current.end_of_day
          )

          item.save!
        end
      end
    end
  end
end
