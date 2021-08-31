ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :role

  # 一覧ページの表示項目
  index do
    selectable_column
    id_column
    column(:name)
    column(:email)
    column(:role) do |user|
      user.role_i18n
    end
    actions
  end

  # 一覧ページのフィルター項目
  filter :name
  filter :email
  filter :role, as: :select, collection: User.roles_i18n.invert.map{ |key, value| [key, User.roles[value]]}
  filter :created_at
  filter :updated_at

  # 詳細ページの表示項目
  show do
    attributes_table do
      row(:id)
      row(:name)
      row(:email)
      row(:role) do |user|
        user.role_i18n
      end
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
    end
    f.actions
  end
end
