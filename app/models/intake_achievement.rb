class IntakeAchievement
  include ActiveModel::Model
  include ActiveModel::Attributes

  # Attributes
  attribute :calorie, :float, default: 0.0
  attribute :protein, :float, default: 0.0
  attribute :fat, :float, default: 0.0
  attribute :carbohydrate, :float, default: 0.0
  attribute :biotin, :float, default: 0.0
  attribute :calcium, :float, default: 0.0
  attribute :chromium, :float, default: 0.0
  attribute :copper, :float, default: 0.0
  attribute :folate, :float, default: 0.0
  attribute :iodine, :float, default: 0.0
  attribute :iron, :float, default: 0.0
  attribute :magnesium, :float, default: 0.0
  attribute :manganese, :float, default: 0.0
  attribute :molybdenum, :float, default: 0.0
  attribute :niacin, :float, default: 0.0
  attribute :pantothenic_acid, :float, default: 0.0
  attribute :phosphorus, :float, default: 0.0
  attribute :potassium, :float, default: 0.0
  attribute :selenium, :float, default: 0.0
  attribute :vitamin_a, :float, default: 0.0
  attribute :vitamin_b1, :float, default: 0.0
  attribute :vitamin_b12, :float, default: 0.0
  attribute :vitamin_b2, :float, default: 0.0
  attribute :vitamin_b6, :float, default: 0.0
  attribute :vitamin_c, :float, default: 0.0
  attribute :vitamin_d, :float, default: 0.0
  attribute :vitamin_e, :float, default: 0.0
  attribute :vitamin_k, :float, default: 0.0
  attribute :zinc, :float, default: 0.0

  # Callbacks
  define_model_callbacks :save
  before_save :attr_validation

  # Validates
  with_options presence: true, numericality: true do
    validates :biotin
    validates :calcium
    validates :calorie
    validates :carbohydrate
    validates :chromium
    validates :copper
    validates :fat
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
    validates :protein
    validates :selenium
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

  # Instance methods
  def calc_intake_achievement(total, bmr, dri, pfc)
    calc_cal_achv(total, bmr)
    calc_nutritions_achv(total, dri, pfc)
  end

  private

    def attr_validation
      valid?
    end

    def calc_cal_achv(total, bmr)
      achv = (total["calorie"] / bmr).floor(2)
      self.attributes = { calorie: achv }
    end

    def calc_nutritions_achv(total, dri, pfc)
      params = attributes

      total.each_key do |k|
        next if k == "calorie"

        params[k] = if dri[k].nil?
                      (total[k] / pfc[k.to_sym]).floor(2)
                    else
                      (total[k] / dri[k]).floor(2)
                    end
      end
      self.attributes = params
    end
end
