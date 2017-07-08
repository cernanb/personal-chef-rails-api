require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires an email and a password' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq(["Email can't be blank", "Email is invalid", "Password can't be blank"])
    end

    it 'requires a first name and last name' do
      user = build(:user, first_name: nil, last_name: nil)
      
      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq(["First name can't be blank", "Last name can't be blank"])
    end

    it 'requires a unique email' do
      user = create(:user)
      user2 = build(:user)

      expect(user2.valid?).to eq(false)
      expect(user2.errors.full_messages).to eq(["Email has already been taken"])
    end
    
    
    it 'requires a valid email' do
      user1 = build(:user, email: 'cernan.com')
      user2 = build(:user, email: 'cernan@something')
      user3 = build(:user, email: 'cernan')

      expect(user1.valid?).to eq(false)
      expect(user1.errors.full_messages).to eq([
        "Email is invalid"
      ])
      expect(user2.valid?).to eq(false)
      expect(user3.valid?).to eq(false)
    end
    
  end

  describe 'on save' do
    it 'hashes a password' do
      user = create(:user)

      expect(user.password_digest).to_not eq(user.password)
    end
  end
  
  describe 'relationships' do
    it 'has many households' do
      user = build(:user)

      household = create(:household, user: user)

      # user.households << household

    end
    
    it 'has many members through households'
    it 'has many meals'
  end
  
end
