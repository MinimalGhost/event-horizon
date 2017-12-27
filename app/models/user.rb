class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true 
  has_many :rsvps
  has_many :events, through: :rsvps
end