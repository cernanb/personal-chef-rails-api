require 'rails_helper'

RSpec.describe Note, type: :model do

  describe 'validations' do
    it 'requires content' do
      note = build(:note, content: nil)

      expect(note.valid?).to eq(false)
    end
  end

  describe 'relationships' do
    it 'belongs to a household' do
      household = create(:household)
      note = create(:note, household: household)

      expect(note.household).to eq(household)
    end
  end
end
