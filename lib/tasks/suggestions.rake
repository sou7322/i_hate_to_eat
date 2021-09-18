namespace :suggestions do
  desc "期限切れのsuggestionを削除"
  task destroy_expied_suggestions: :environment do
  end

  desc "ユーザーごとに当日の食事内容を新規作成"
  task create_suggestion: :environment do
    require "benchmark"

    puts Benchmark.measure {
      rand = Rails.env.production? ? "RANDOM()" : "RAND()"

      def sum_calories(foods)
        @total_cal = 0
        foods.each do |f|
          cal = f.calorie * f.reference_amount
          @total_cal += cal
        end
      end

      User.find_each do |user|
        meal_menus = []

        reg = Food.h_prio
        main = Food.m_prio.maindish.order(rand).limit(1)
        staple = Food.m_prio.staple_food.order(rand).limit(1)

        meal_menus.concat(reg, main, staple)
        sum_calories(meal_menus)

        bmr = user.bmr
        while @total_cal <= bmr + 50
          side = Food.rm_prio.sidedish.order(rand).limit(1)

          # nextはrakeタスク内ではタスク自体の中断コマンド
          # ループのスキップとしては使えない？
          # とりあえずunless使用しておく
          unless meal_menus.include?(*side)
            meal_menus.concat(side)
            sum_calories(meal_menus)
          end
        end

        meal_menus.each do |m|
          item = user.suggestions.new(
            food_id: m.id,
            amount: m.reference_amount,
            target_date: Time.zone.today,
            expies_at: Time.current.end_of_day
          )

          item.save!
        end
      end
    }
  end
end
