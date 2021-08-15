FactoryBot.define do
  factory :user do
    sequence(:name, 'name_0')
    sequence(:email) { |n| "user_#{n}@example.com" }
    # password { "password" }
    # password_confirmation { "password" }
    role { 0 }
  end
end

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  role             :integer          not null
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
