require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it "名前、メールアドレス、パスワードがあれば有効であること" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it "名前がなければ無効であること" do
      user = build(:user, name: "")
      user.valid?
      expect(user).to be_invalid
      # expect(user.errors[:name]).to include "can"t be blank"
    end

    it "メールアドレスがなければ無効であること" do
      user = build(:user, email: "")
      user.valid?
      expect(user).to be_invalid
      # expect(user.errors[:email]).to include "can"t be blank"
    end

    it "重複したメールアドレスの場合は無効であること" do
      user = create(:user)
      duplicate_user = build(:user, email: user.email)
      expect(duplicate_user).to be_invalid
      # expect(duplicate_user.errors[:email]).to include "has already been taken"
    end
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
