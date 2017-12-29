class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true
  has_many :rsvps
  has_many :events, through: :rsvps

  def event_num
    self.events.count
  end

end
