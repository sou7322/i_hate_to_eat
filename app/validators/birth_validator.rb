class BirthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.future?
      record.errors.add(:base, "未来の日付は入力できません")
    end

    age = record.calc_age
    if age < 18 || age >60
      record.errors.add(:base, "本サービスは18歳以上60歳未満の方が対象です")
    end
  end
end