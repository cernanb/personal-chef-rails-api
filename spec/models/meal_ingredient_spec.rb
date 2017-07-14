require 'rails_helper'

RSpec.describe MealIngredient, type: :model do
  describe "validations" do
    it 'requires a meal, ingredient' do
      meal_ing = MealIngredient.new

      expect(meal_ing.valid?).to eq(false)
      expect(meal_ing.errors.full_messages).to eq([
        "Ingredient must exist",
        "Meal must exist",
        "Measurement can't be blank"
      ])
    end

    it 'requires a measurement' do
      meal_ing = build(:meal_ingredient, measurement: nil)

      expect(meal_ing.valid?).to eq(false)
      expect(meal_ing.errors.full_messages).to eq([
        "Measurement can't be blank"
      ])
    end
    
  end
  
  describe "relationships" do
    before(:each) do
      @meal_ing = create(:meal_ingredient)
    end
    
    it 'belongs to a meal' do
      expect(@meal_ing.meal.name).to eq("Chicken Soup")
    end
    
    it 'belongs to a ingredient' do
      expect(@meal_ing.ingredient.name).to eq("Noodles")
    end
  end
  
end
