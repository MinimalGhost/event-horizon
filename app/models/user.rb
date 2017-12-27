class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true
  has_many :rsvps
  has_many :events, through: :rsvps
end
