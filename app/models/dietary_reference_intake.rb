class DietaryReferenceIntake < ApplicationRecord
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
