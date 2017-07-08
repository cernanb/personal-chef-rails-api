require 'rails_helper'

RSpec.describe Member, type: :model do

  before(:each) do
    @user = create(:user)
    @household = create(:household, user: @user)
  end
  
  describe 'validations' do 
    it 'requires a first name' do
      member = build(:member, household: @household, first_name: nil)
      
      expect(member.valid?).to eq(false)
    end
    
    it 'requires a last name' do
      member = build(:member, household: @household, last_name: nil)
      
      expect(member.valid?).to eq(false)
    end
    
    it 'requires a phone number' do
      member = build(:member, household: @household, phone_number: nil)
      
      expect(member.valid?).to eq(false)
    end
    
  end

  describe 'relationships' do
    it 'belongs to a household'
  end
  
  
end
