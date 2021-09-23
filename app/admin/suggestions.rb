ActiveAdmin.register Suggestion do
  permit_params :user_id, :food_id, :amount, :target_date, :expires_at

  # Index
  index do
    selectable_column
    id_column
    column(:user_id)
    column(:food_id)
    column(:target_date)
    column(:expires_at)
    actions
  end

  # Index filter
  filter :user_id
  filter :expires_at

  # Show
  show do
    attributes_table do
      row(:id)
      row(:user_id)
      row(:food_id)
      row(:amount)
      row(:target_date)
      row(:expires_at)
    end
  end
end
