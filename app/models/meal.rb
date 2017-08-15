class Meal < ApplicationRecord
  validates :name, presence: true
  
  has_many :user_meals
  has_many :users, through: :user_meals

  has_many :household_meals
  has_many :households, through: :household_meals
end
