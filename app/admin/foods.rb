ActiveAdmin.register Food do
  permit_params :id, :name, :food_category_id, :priority,
                :reference_amount, :description,
                :vitamin_a, :vitamin_d, :vitamin_e, :vitamin_k,
                :vitamin_b1, :vitamin_b2, :niacin, :vitamin_b6,
                :vitamin_b12, :folate, :pantothenic_acid, :biotin,
                :vitamin_c, :sodium, :potassium, :calcium, :magnesium,
                :phosphorus, :iron, :zinc, :copper, :manganese,
                :iodine, :selenium, :chromium, :molybdenum

  # 一覧ページの表示項目
  index do
    selectable_column
    id_column
    column(:food_category_id)
    column(:name)
    column(:priority)
    actions
  end

  # 一覧ページのフィルター項目
  filter :name
  filter :food_category_id
  filter :priority

  # 詳細ページの表示項目
  show do
    attributes_table do
      row(:id)
      row(:food_category_id)
      row(:name)
      row(:priority)
      row(:reference_amount)
      row(:description)
      row(:calcium)
      row(:magnesium)
      row(:phosphorus)
      row(:iron)
      row(:zinc)
      row(:copper)
      row(:manganese)
      row(:iodine)
      row(:selenium)
      row(:chromium)
      row(:molybdenum)
      row(:magnesium)
      row(:vitamin_a)
      row(:vitamin_d)
      row(:vitamin_e)
      row(:vitamin_k)
      row(:vitamin_b1)
      row(:vitamin_b2)
      row(:niacin)
      row(:vitamin_b6)
      row(:vitamin_b12)
      row(:folate)
      row(:pantothenic_acid)
      row(:biotin)
      row(:vitamin_c)
      row(:created_at)
      row(:updated_at)
    end
  end

  form do |f|
    f.inputs do
      f.input :food_category_id
      f.input :name
      f.input :priority
      f.input :reference_amount
      f.input :description
    end
    f.actions
  end  
end
