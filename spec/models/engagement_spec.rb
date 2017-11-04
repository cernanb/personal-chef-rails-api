require 'rails_helper'

RSpec.describe Engagement, type: :model do
  describe "associations" do
    it "belongs to a household" do
      engagement = create(:engagement)

      expect(engagement.household).to_not be_nil
    end



  end

  describe "validations" do
    it "requires a date" do
      engagement = build(:engagement, date: nil)

      expect(engagement).to_not be_valid
    end
  end
end
