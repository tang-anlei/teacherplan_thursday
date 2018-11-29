class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :coaches,
             :class_name => "CoachAssignment",
             :foreign_key => "improvement_id",
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :coachs,
             :through => :coaches,
             :source => :user

  # Validations

end
