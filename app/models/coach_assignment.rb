class CoachAssignment < ApplicationRecord
  # Direct associations

  belongs_to :improvement,
             :class_name => "ImprovementPlan"

  belongs_to :user

  # Indirect associations

  # Validations

end
