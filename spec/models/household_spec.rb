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

    it 'has many members' do
      user = create(:user)
      household = build(:household, user: user)

      member1 = create(:member, household: household)
      member2 = create(:member, household: household)

      expect(household.members.size).to eq(2)
    end
    
  end
  
  
end
