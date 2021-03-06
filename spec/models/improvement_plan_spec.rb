require 'rails_helper'

RSpec.describe ImprovementPlan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:coaches) }

    it { should have_many(:goals) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_many(:coachs) }

    end

    describe "Validations" do
      
    end
end
