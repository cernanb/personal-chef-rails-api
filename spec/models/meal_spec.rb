require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'validations' do
    it 'requires a name' do 
      meal = build(:meal, name: nil)

      expect(meal.valid?).to eq(false)
      expect(meal.errors.full_messages).to eq([
        "Name can't be blank"
      ])
    end
    
  end

  describe 'relationships' do
    it 'has many user_meals' do
      cernan = create(:user)
      meal = create(:meal)

      meal.user_meals.create(user: cernan)

      expect(meal.user_meals.size).to eq(1)
    end
    
    it 'has many users, through user_meals' do
      cernan = create(:user)
      meal = create(:meal)

      meal.user_meals.create(user: cernan)

      expect(meal.users.size).to eq(1)

    end
    
  end
  
end
