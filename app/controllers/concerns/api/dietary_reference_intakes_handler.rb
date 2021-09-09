module Api::DietaryReferenceIntakesHandler
  extend ActiveSupport::Concern

  included do
    def set_reference_intake(user)
      dri = witch_gender?(user)
      check_age_range(user, dri)
    end
  end

  def witch_gender?(user)
    if user.gender == 'female'
      DietaryReferenceIntake.for_female
    else
      DietaryReferenceIntake.for_maele
    end
  end

  def check_age_range(user, dri)
    age = user.calc_age

    case age
    when 18..29
      dri.for_eighteen_to_twentynine
    when 30..49
      dri.for_thirty_to_fortynine
    when 50..64
      dri.for_fifty_to_sixtyfour
    end
  end
end