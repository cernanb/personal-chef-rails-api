class MealIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal
  validates :measurement, presence: true
end
