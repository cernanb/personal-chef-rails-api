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
end
