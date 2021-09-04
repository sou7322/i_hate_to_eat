FactoryBot.define do
  factory :user do
    sequence(:name, "name_0")
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    role { 0 }
  end
end

# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  birth                   :date
#  bmr                     :float(24)        default(0.0), not null
#  crypted_password        :string(255)
#  email                   :string(255)      not null
#  gender                  :integer          default("female"), not null
#  height                  :integer          default(0), not null
#  name                    :string(255)      not null
#  percentage_carbohydrate :float(24)        default(0.6), not null
#  percentage_fat          :float(24)        default(0.2), not null
#  percentage_protein      :float(24)        default(0.2), not null
#  role                    :integer          default("general"), not null
#  salt                    :string(255)
#  weight                  :float(24)        default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
