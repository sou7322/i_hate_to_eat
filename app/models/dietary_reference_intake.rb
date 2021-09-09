class DietaryReferenceIntake < ApplicationRecord
  # Associations
  has_many :users, dependent: :nullify
  
  # Enums
  enum gender: { female: 0, male: 10 }

  # Scopes
  scope :for_female, -> { where(gender: 'female') }
  scope :for_maele, -> { where(gender: 'male') }

  # Validations
  with_options presence: true do
    validates :gender

    with_options numericality: true do
      validates :age_bottom
      validates :age_top
      validates :biotin
      validates :calcium
      validates :chromium
      validates :copper
      validates :folate
      validates :iodine
      validates :iron
      validates :magnesium
      validates :manganese
      validates :molybdenum
      validates :niacin
      validates :pantothenic_acid
      validates :phosphorus
      validates :potassium
      validates :selenium
      validates :upper_limit_calcium
      validates :upper_limit_chromium
      validates :upper_limit_copper
      validates :upper_limit_folate
      validates :upper_limit_iodine
      validates :upper_limit_iron
      validates :upper_limit_manganese
      validates :upper_limit_molybdenum
      validates :upper_limit_niacin
      validates :upper_limit_phosphorus
      validates :upper_limit_selenium
      validates :upper_limit_vitamin_a
      validates :upper_limit_vitamin_b6
      validates :upper_limit_vitamin_d
      validates :upper_limit_vitamin_e
      validates :upper_limit_zinc
      validates :vitamin_a
      validates :vitamin_b1
      validates :vitamin_b12
      validates :vitamin_b2
      validates :vitamin_b6
      validates :vitamin_c
      validates :vitamin_d
      validates :vitamin_e
      validates :vitamin_k
      validates :zinc
    end
  end

  # Class methods
  def self.for_eighteen_to_twentynine
    find_by(age_bottom: 18)
  end

  def self.for_thirty_to_fortynine
    find_by(age_bottom: 30)
  end

  def self.for_fifty_to_sixtyfour
    find_by(age_bottom: 50)
  end
end

# == Schema Information
#
# Table name: dietary_reference_intakes
#
#  id                     :bigint           not null, primary key
#  age_bottom             :integer          not null
#  age_top                :integer          not null
#  biotin                 :float(24)        not null
#  calcium                :float(24)        not null
#  chromium               :float(24)        not null
#  copper                 :float(24)        not null
#  folate                 :float(24)        not null
#  gender                 :integer          not null
#  iodine                 :float(24)        not null
#  iron                   :float(24)        not null
#  magnesium              :float(24)        not null
#  manganese              :float(24)        not null
#  molybdenum             :float(24)        not null
#  niacin                 :float(24)        not null
#  pantothenic_acid       :float(24)        not null
#  phosphorus             :float(24)        not null
#  potassium              :float(24)        not null
#  selenium               :float(24)        not null
#  upper_limit_calcium    :float(24)        not null
#  upper_limit_chromium   :float(24)        not null
#  upper_limit_copper     :float(24)        not null
#  upper_limit_folate     :float(24)        not null
#  upper_limit_iodine     :float(24)        not null
#  upper_limit_iron       :float(24)        not null
#  upper_limit_manganese  :float(24)        not null
#  upper_limit_molybdenum :float(24)        not null
#  upper_limit_niacin     :float(24)        not null
#  upper_limit_phosphorus :float(24)        not null
#  upper_limit_selenium   :float(24)        not null
#  upper_limit_vitamin_a  :float(24)        not null
#  upper_limit_vitamin_b6 :float(24)        not null
#  upper_limit_vitamin_d  :float(24)        not null
#  upper_limit_vitamin_e  :float(24)        not null
#  upper_limit_zinc       :float(24)        not null
#  vitamin_a              :float(24)        not null
#  vitamin_b1             :float(24)        not null
#  vitamin_b12            :float(24)        not null
#  vitamin_b2             :float(24)        not null
#  vitamin_b6             :float(24)        not null
#  vitamin_c              :float(24)        not null
#  vitamin_d              :float(24)        not null
#  vitamin_e              :float(24)        not null
#  vitamin_k              :float(24)        not null
#  zinc                   :float(24)        not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
