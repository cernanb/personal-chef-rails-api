require 'rails_helper'

RSpec.describe Household, type: :model do

  it "has a default value of false for client?" do
    household = build(:household)

    expect(household.client?).to eq(false)
  end

  describe 'instance methods' do

    describe 'convert_to_client' do
      it 'converts a household to a client' do
        household = create(:household)

        household.convert_to_client(1000)
        expect(household.client?).to eq(true)
      end

      it 'allows user to change the monthly rate for a converted lead' do
        household = create(:household)

        household.convert_to_client(1000)
        expect(household.client?).to eq(true)
        expect(household.monthly_rate).to eq(1000)
      end

    end

  end

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

    it 'has many notes' do
      user = create(:user)
      household = build(:household, user: user)

      note1 = create(:note, household: household)
      note2 = create(:note, household: household)

      expect(household.notes.size).to eq(2)
    end

  end


end
