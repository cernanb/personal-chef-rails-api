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

  describe 'scope methods' do
    it 'has many household leads' do
      user = build(:user)

      household1 = create(:household, user: user)
      household2 = create(:household, user: user, client?: true)

      user.households << household1
      user.households << household2

      expect(user.leads.size).to eq(1)
    end
    
    it 'has many household clients' do
      user = build(:user)

      household1 = create(:household, user: user)
      household2 = create(:household, user: user, client?: true)

      user.households << household1
      user.households << household2

      expect(user.clients.size).to eq(1)
    end
    
  end
  
  
  describe 'relationships' do
    it 'has many household leads' do
      user = build(:user)

      household = create(:household, user: user)

      user.households << household

      expect(user.households.size).to eq(1)
    end
    
    it 'has many members through households' do
      user = create(:user)
      household =  create(:household, user: user)
      member1 = create(:member, household: household)
      member2 = create(:member, household: household)
      expect(user.members.size).to eq(2)
    end
    
    it 'has many user meals' do
      cernan = create(:user)
      meal = create(:meal)

      cernan.user_meals.create(meal: meal)

      expect(cernan.user_meals.size).to eq(1)
    end

    it 'has many meals, through user meals' do
      cernan = create(:user)
      meal = create(:meal)

      cernan.user_meals.create(meal: meal)

      expect(cernan.meals.size).to eq(1)
    end
    
  end
  
end
