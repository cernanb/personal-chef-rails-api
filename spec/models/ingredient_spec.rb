require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it 'requires a name' do
      ing = build(:ingredient, name: nil)
      
      expect(ing.valid?).to eq(false)
      expect(ing.errors.full_messages).to eq([
        "Name can't be blank"
      ])
    end
    
  end
  
  describe 'associations' do
    it 'has many meal_ingredients' do
      ing = create(:ingredient)
      meal = create(:meal)

      ing.meal_ingredients.create(meal: meal)

      expect(ing.meal_ingredients.size).to eq(1)
    end
    
    it 'has many meals, through meal_ingredients' do
      ing = create(:ingredient)
      meal = create(:meal)

      ing.meal_ingredients.create(meal: meal, measurement: "1 cup")

      expect(ing.meals.size).to eq(1)
    end
    
  end
  
end
