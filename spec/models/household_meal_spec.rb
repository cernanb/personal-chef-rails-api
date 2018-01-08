require 'rails_helper'

RSpec.describe HouseholdMeal, type: :model do
  describe "validations" do
    it "requires a household" do
      household_meal = build(:household_meal, household_id: nil)
      expect(household_meal).to_not be_valid
    end

    it "requires a meal" do
      household_meal = build(:household_meal, meal_id: nil)
      expect(household_meal).to_not be_valid
    end
  end
end
