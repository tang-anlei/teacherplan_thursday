require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:coach_assignments) }

    it { should have_one(:improvement_plan) }

    end

    describe "InDirect Associations" do

    it { should have_many(:coaching_assignments) }

    end

    describe "Validations" do
      
    end
end
