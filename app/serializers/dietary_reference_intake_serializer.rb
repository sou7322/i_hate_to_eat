class DietaryReferenceIntakeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :biotin, :calcium, :chromium, :copper, :folate, :iodine,
             :iron, :magnesium, :manganese, :molybdenum, :niacin,
             :pantothenic_acid, :phosphorus, :potassium, :selenium,
             :upper_limit_calcium, :upper_limit_chromium, :upper_limit_copper,
             :upper_limit_folate, :upper_limit_iodine, :upper_limit_iron,
             :upper_limit_manganese, :upper_limit_molybdenum, :upper_limit_niacin,
             :upper_limit_phosphorus, :upper_limit_selenium, :upper_limit_vitamin_a,
             :upper_limit_vitamin_b6, :upper_limit_vitamin_d, :upper_limit_vitamin_e,
             :upper_limit_zinc, :vitamin_a, :vitamin_b1, :vitamin_b12,
             :vitamin_b2, :vitamin_b6, :vitamin_c, :vitamin_d,
             :vitamin_e, :vitamin_k, :zinc

  has_many :users
end
