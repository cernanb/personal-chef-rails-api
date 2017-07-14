class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients
end
