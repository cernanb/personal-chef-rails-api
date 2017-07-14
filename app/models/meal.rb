class Meal < ApplicationRecord
  validates :name, presence: true
  
  has_many :user_meals
end
