ActiveAdmin.register DietaryReferenceIntake do
  permit_params :gender, :age_top, :age_bottom, :vitamin_a, :upper_limit_vitamin_a,
                :vitamin_d, :upper_limit_vitamin_d, :vitamin_e, :upper_limit_vitamin_e,
                :vitamin_k, :vitamin_b1, :vitamin_b2, :niacin, :upper_limit_niacin,
                :vitamin_b6, :upper_limit_vitamin_b6, :vitamin_b12, :folate, :upper_limit_folate,
                :pantothenic_acid, :biotin, :vitamin_c, :sodium, :potassium,
                :calcium, :upper_limit_calcium, :magnesium, :phosphorus, :upper_limit_phosphorus,
                :iron, :upper_limit_iron, :zinc, :upper_limit_zinc, :copper, :upper_limit_copper,
                :manganese, :upper_limit_manganese, :iodine, :upper_limit_iodine,
                :selenium, :upper_limit_selenium, :chromium, :upper_limit_chromium,
                :molybdenum, :upper_limit_molybdenum

  # 一覧ページの表示項目
  index do
    selectable_column
    id_column
    column(:gender, &:gender_i18n)
    column(:age_bottom)
    column(:age_top)
    actions
  end

  # 一覧ページのフィルター項目
  filter :gender, as: :select, collection: DietaryReferenceIntake.genders_i18n.invert.map { |key, value| [key, DietaryReferenceIntake.genders[value]] }

  # 詳細ページの表示項目
  show do
    attributes_table do
      row(:id)
      row(:gender, &:gender_i18n)
      row(:age_bottom)
      row(:age_top)
      row(:potassium)
      row(:calcium)
      row(:upper_limit_calcium)
      row(:magnesium)
      row(:phosphorus)
      row(:upper_limit_phosphorus)
      row(:iron)
      row(:upper_limit_iron)
      row(:zinc)
      row(:upper_limit_zinc)
      row(:copper)
      row(:upper_limit_copper)
      row(:manganese)
      row(:upper_limit_manganese)
      row(:iodine)
      row(:upper_limit_iodine)
      row(:selenium)
      row(:upper_limit_selenium)
      row(:chromium)
      row(:molybdenum)
      row(:upper_limit_molybdenum)
      row(:upper_limit_chromium)
      row(:magnesium)
      row(:vitamin_a)
      row(:upper_limit_vitamin_a)
      row(:vitamin_d)
      row(:upper_limit_vitamin_d)
      row(:vitamin_e)
      row(:upper_limit_vitamin_e)
      row(:vitamin_k)
      row(:vitamin_b1)
      row(:vitamin_b2)
      row(:niacin)
      row(:upper_limit_niacin)
      row(:vitamin_b6)
      row(:upper_limit_vitamin_b6)
      row(:vitamin_b12)
      row(:folate)
      row(:upper_limit_folate)
      row(:pantothenic_acid)
      row(:biotin)
      row(:vitamin_c)
      row(:created_at)
      row(:updated_at)
    end
  end

  form do |f|
    f.inputs do
      f.input :gender, collention: DietaryReferenceIntake.genders_i18n.invert
      f.input :age_bottom
      f.input :age_top        
    end
    f.actions
  end
end
