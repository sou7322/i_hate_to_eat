class User < ApplicationRecord
  authenticates_with_sorcery!

  enum gender: { female: 0, male: 10 }
  enum role: { general: 0, admin: 10 }

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :email, uniqueness: true
    validates :role
    validates :gender
    validates :height, numericality: { only_integer: true }

    with_options numericality: true do
      validates :weight
      validates :bmr
    end
  end
  validates :birth, birth: true
  validates :password, length: { minimum: 5 }, if: :new_or_changes_password
  validates :password, confirmation: true, if: :new_or_changes_password
  validates :password_confirmation, presence: true, if: :new_or_changes_password

  def calc_bmr
    age = calc_age

    if gender == 'female'
      9.247 * weight + 3.098 * height - 4.33 * age + 447.593
    else
      13.397 * weight + 4.799 * height - 5.677 * age + 88.362
    end
  end

  def calc_age
    (Time.zone.today.strftime("%Y%m%d").to_i - birth.strftime("%Y%m%d").to_i) / 10_000
  end

  private

    def new_or_changes_password
      new_record? || changes[:crypted_password]
    end
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
