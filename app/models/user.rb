class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_many :households
  has_many :members, through: :households
  has_many :user_meals

  has_secure_password
end
