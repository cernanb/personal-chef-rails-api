class HouseholdMeal < ApplicationRecord
  belongs_to :household
  belongs_to :meal
end
