class EngagementMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :engagement
end
