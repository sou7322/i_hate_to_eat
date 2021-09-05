ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation,
                :role, :gender, :birth, :height, :weight,
                :percentage_protein, :percentage_fat, :percentage_carbohydrate

  # 一覧ページの表示項目
  index do
    selectable_column
    id_column
    column(:name)
    column(:email)
    column(:role, &:role_i18n)
    actions
  end

  # 一覧ページのフィルター項目
  filter :name
  filter :email
  filter :role, as: :select, collection: User.roles_i18n.invert.map { |key, value| [key, User.roles[value]] }
  filter :gender, as: :select, collection: User.genders_i18n.invert.map { |key, value| [key, User.genders[value]] }

  # 詳細ページの表示項目
  show do
    attributes_table do
      row(:id)
      row(:name)
      row(:email)
      row(:role, &:role_i18n)
      row(:gender, &:gender_i18n)
      row(:birth)
      row(:height)
      row(:weight)
      row(:bmr)
      row(:percentage_protein)
      row(:percentage_fat)
      row(:percentage_carbohydrate)
      row(:created_at)
      row(:updated_at)
    end
  end

  # フォームの入力項目
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, collection: User.roles_i18n.invert
      f.input :gender, collection: User.genders_i18n.invert
      f.input :birth
      f.input :height
      f.input :weight
      f.input :percentage_protein
      f.input :percentage_fat
      f.input :percentage_carbohydrate
    end
    f.actions
  end
end
