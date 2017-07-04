require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires an email and a password' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq(["Email can't be blank", "Password can't be blank"])
    end

    it 'requires a first name and last name' do
      user = build(:user, first_name: nil, last_name: nil)
      
      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq(["First name can't be blank", "Last name can't be blank"])
    end
    
  end
end
