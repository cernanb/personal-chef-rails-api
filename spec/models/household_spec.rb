require 'rails_helper'

RSpec.describe Household, type: :model do

  describe 'validations' do
    it 'requires a name' do
      household = build(:household, name: nil)

      expect(household.valid?).to eq(false)
    end

    it 'requires a address' do
      household = build(:household, address: nil)

      expect(household.valid?).to eq(false)
    end
    
    
  end

  describe 'relationships' do
    it 'belongs to a user' do
      user = create(:user)
      household = create(:household, user: user)

      expect(household.user).to eq(user)
    end
  end
  
  
end
