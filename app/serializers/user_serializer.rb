class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :role
end

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  birth            :date
#  bmr              :float(24)        default(0.0), not null
#  crypted_password :string(255)
#  email            :string(255)      not null
#  gender           :integer          default("female"), not null
#  height           :integer          default(0), not null
#  name             :string(255)      not null
#  role             :integer          default("general"), not null
#  salt             :string(255)
#  weight           :float(24)        default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
