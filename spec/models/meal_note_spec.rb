require 'rails_helper'

RSpec.describe MealNote, type: :model do
  describe "associations" do
    it 'belongs to a meal' do
      meal = create(:meal)
      meal_note = build(:meal_note, meal: meal)

      expect(meal_note.meal).to eq(meal)
    end
  end
end
