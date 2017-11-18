class Household < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :members
  has_many :household_meals
  has_many :meals, through: :household_meals
  has_many :notes
  has_many :engagements

  def convert_to_client(rate)
    update(client?: true, monthly_rate: rate)
  end

  def next_engagement
    self.engagements.where('date > ?', Date.today).first
  end

end
