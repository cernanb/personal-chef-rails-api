class Meal < ApplicationRecord
  validates :name, presence: true
  
  has_many :user_meals
  has_many :users, through: :user_meals

  has_many :household_meals
  has_many :households, through: :household_meals

  has_many :engagement_meals
  has_many :meals, through: :engagement_meals

  has_many :meal_notes
end
