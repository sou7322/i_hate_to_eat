ActiveAdmin.register FoodCategory do
  actions :all, except: [:destroy]

  permit_params :name

  # 一覧ページの表示項目
  index do
    selectable_column
    id_column
    column(:name)
    actions
  end

  # 一覧ページのフィルター項目
  filter :name

  # 詳細ページの表示項目
  show do
    attributes_table do
      row(:id)
      row(:name)
      row(:created_at)
      row(:updated_at)
    end
  end

  # フォームの入力項目
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
