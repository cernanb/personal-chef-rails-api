require 'rails_helper'

RSpec.describe UserMeal, type: :model do
  describe 'validations' do
    it 'requires a user, meal' do
      user_meal = UserMeal.new

      expect(user_meal.valid?).to eq(false)
      expect(user_meal.errors.full_messages).to eq([
        "User must exist",
        "Meal must exist"
      ])
    end
    
  end
  
  describe 'relationships' do
    before(:each) do
      @user_meal = create(:user_meal)
    end
    
    it 'belongs to a user' do
      expect(@user_meal.user.first_name).to eq("Cernan")
    end
    
    it 'belongs to a meal' do
      expect(@user_meal.meal.name).to eq("Chicken Soup")
    end
    
  end
  
end
