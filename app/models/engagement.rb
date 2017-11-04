class Engagement < ApplicationRecord
  belongs_to :household

  validates :date, presence: true
end
