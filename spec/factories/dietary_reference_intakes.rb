FactoryBot.define do
  factory :dietary_reference_intake do
    trait :f_u29 do
      age_bottom { 18 }
      age_top { 29 }
      gender { "female" }
    end

    trait :f_u49 do
      age_bottom { 30 }
      age_top { 49 }
      gender { "female" }
    end

    trait :f_u64 do
      age_bottom { 50 }
      age_top { 64 }
      gender { "female" }
    end

    trait :m_u29 do
      age_bottom { 18 }
      age_top { 29 }
      gender { "male" }
    end

    trait :m_u49 do
      age_bottom { 30 }
      age_top { 49 }
      gender { "male" }
    end

    trait :m_u64 do
      age_bottom { 50 }
      age_top { 64 }
      gender { "male" }
    end
  end
end

# == Schema Information
#
# Table name: dietary_reference_intakes
#
#  id                     :bigint           not null, primary key
#  age_bottom             :integer          default(0), not null
#  age_top                :integer          default(0), not null
#  biotin                 :float(24)        default(0.0), not null
#  calcium                :float(24)        default(0.0), not null
#  chromium               :float(24)        default(0.0), not null
#  copper                 :float(24)        default(0.0), not null
#  folate                 :float(24)        default(0.0), not null
#  gender                 :integer          default("female"), not null
#  iodine                 :float(24)        default(0.0), not null
#  iron                   :float(24)        default(0.0), not null
#  magnesium              :float(24)        default(0.0), not null
#  manganese              :float(24)        default(0.0), not null
#  molybdenum             :float(24)        default(0.0), not null
#  niacin                 :float(24)        default(0.0), not null
#  pantothenic_acid       :float(24)        default(0.0), not null
#  phosphorus             :float(24)        default(0.0), not null
#  potassium              :float(24)        default(0.0), not null
#  selenium               :float(24)        default(0.0), not null
#  upper_limit_calcium    :float(24)        default(0.0), not null
#  upper_limit_chromium   :float(24)        default(0.0), not null
#  upper_limit_copper     :float(24)        default(0.0), not null
#  upper_limit_folate     :float(24)        default(0.0), not null
#  upper_limit_iodine     :float(24)        default(0.0), not null
#  upper_limit_iron       :float(24)        default(0.0), not null
#  upper_limit_manganese  :float(24)        default(0.0), not null
#  upper_limit_molybdenum :float(24)        default(0.0), not null
#  upper_limit_niacin     :float(24)        default(0.0), not null
#  upper_limit_phosphorus :float(24)        default(0.0), not null
#  upper_limit_selenium   :float(24)        default(0.0), not null
#  upper_limit_vitamin_a  :float(24)        default(0.0), not null
#  upper_limit_vitamin_b6 :float(24)        default(0.0), not null
#  upper_limit_vitamin_d  :float(24)        default(0.0), not null
#  upper_limit_vitamin_e  :float(24)        default(0.0), not null
#  upper_limit_zinc       :float(24)        default(0.0), not null
#  vitamin_a              :float(24)        default(0.0), not null
#  vitamin_b1             :float(24)        default(0.0), not null
#  vitamin_b12            :float(24)        default(0.0), not null
#  vitamin_b2             :float(24)        default(0.0), not null
#  vitamin_b6             :float(24)        default(0.0), not null
#  vitamin_c              :float(24)        default(0.0), not null
#  vitamin_d              :float(24)        default(0.0), not null
#  vitamin_e              :float(24)        default(0.0), not null
#  vitamin_k              :float(24)        default(0.0), not null
#  zinc                   :float(24)        default(0.0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
