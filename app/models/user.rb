class User < ApplicationRecord
  authenticates_with_sorcery!

  # Associations
  belongs_to :dietary_reference_intake
  has_many :suggestions, dependent: :destroy
  has_many :suggested_foods, through: :suggestions, source: :food

  # Enums
  enum gender: { female: 0, male: 10 }
  enum role: { general: 0, admin: 10 }

  # Validations
  include ActiveModel::Validations
  validates_with PfcValidator

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :email, uniqueness: { case_sensitive: false }
    validates :role
    validates :gender
    validates :height, numericality: { only_integer: true }

    with_options numericality: true do
      validates :weight
      validates :bmr
    end

    with_options numericality: { greater_than_or_equal_to: 0.1,
                                 less_than_or_equal_to: 0.8 } do
      validates :percentage_protein
      validates :percentage_fat
      validates :percentage_carbohydrate
    end
  end

  validates :birth, birth: true
  validates :password, length: { minimum: 5 }, if: :new_or_changes_password
  validates :password, confirmation: true, if: :new_or_changes_password
  validates :password_confirmation, presence: true, if: :new_or_changes_password

  # Instance methods
  # BMR
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

  # PFC Balance
  def set_percentage_pfc
    { pctP: percentage_protein,
      pctF: percentage_fat,
      pctC: percentage_carbohydrate }
  end

  def set_amount_pfc
    { protein: calc_amount_protein,
      fat: calc_amount_fat,
      carbohydrate: calc_amount_carbo }
  end

  private

    def calc_amount_protein
      bmr * percentage_protein / 4
    end

    def calc_amount_fat
      bmr * percentage_fat / 9
    end

    def calc_amount_carbo
      bmr * percentage_carbohydrate / 4
    end

    def new_or_changes_password
      new_record? || changes[:crypted_password]
    end
end

# == Schema Information
#
# Table name: users
#
#  id                          :bigint           not null, primary key
#  birth                       :date
#  bmr                         :float(24)        default(0.0), not null
#  crypted_password            :string(255)
#  email                       :string(255)      not null
#  gender                      :integer          default("female"), not null
#  height                      :integer          default(0), not null
#  name                        :string(255)      not null
#  percentage_carbohydrate     :float(24)        default(0.6), not null
#  percentage_fat              :float(24)        default(0.2), not null
#  percentage_protein          :float(24)        default(0.2), not null
#  role                        :integer          default("general"), not null
#  salt                        :string(255)
#  weight                      :float(24)        default(0.0), not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  dietary_reference_intake_id :bigint
#
# Indexes
#
#  index_users_on_dietary_reference_intake_id  (dietary_reference_intake_id)
#  index_users_on_email                        (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (dietary_reference_intake_id => dietary_reference_intakes.id)
#
