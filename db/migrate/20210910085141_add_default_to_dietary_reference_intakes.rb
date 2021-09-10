class AddDefaultToDietaryReferenceIntakes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :dietary_reference_intakes, :age_bottom, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :age_top, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :biotin, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :calcium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :chromium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :copper, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :folate, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :gender, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :iodine, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :iron, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :magnesium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :manganese, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :molybdenum, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :niacin, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :pantothenic_acid, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :phosphorus, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :potassium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :selenium,from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_calcium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_chromium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_copper, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_folate, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_iodine, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_iron, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_manganese, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_molybdenum, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_niacin, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_phosphorus, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_selenium, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_vitamin_a, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_vitamin_b6, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_vitamin_d, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_vitamin_e, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :upper_limit_zinc, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_a, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_b1, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_b12, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_b2, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_b6, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_c, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_d, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_e, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :vitamin_k, from: nil, to: 0
    change_column_default :dietary_reference_intakes, :zinc, from: nil, to: 0
  end
end
