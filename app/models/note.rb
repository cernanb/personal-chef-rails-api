class Note < ApplicationRecord
  belongs_to :household
  validates :content, presence: true
end
