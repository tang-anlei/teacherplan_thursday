class User < ApplicationRecord
  # Direct associations

  has_many   :coach_assignments,
             :dependent => :destroy

  has_one    :improvement_plan,
             :dependent => :destroy

  # Indirect associations

  has_many   :coaching_assignments,
             :through => :coach_assignments,
             :source => :improvement

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
