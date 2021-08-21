class User < ApplicationRecord
  authenticates_with_sorcery!

  enum role: { general: 0, admin: 10 }

  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
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
#  role             :integer          default("general"), not null
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
