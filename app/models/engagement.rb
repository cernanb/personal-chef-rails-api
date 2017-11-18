class Engagement < ApplicationRecord
  belongs_to :household
  has_many :engagement_meals
  has_many :meals, through: :engagement_meals

  validates :date, presence: true
end
