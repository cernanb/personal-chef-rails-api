class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :meal_ingredients
end
