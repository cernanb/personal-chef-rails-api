require 'rails_helper'

RSpec.describe HouseholdMeal, type: :model do
  describe "validations" do
    it "requires a household" do
      household_meal = build(:household_meal)
      expect(household_meal).to be_valid
    end
  end
end
