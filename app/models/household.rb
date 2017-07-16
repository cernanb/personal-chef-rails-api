class Household < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :members

  def convert_to_client
    update(client?: true)
  end
  
end
