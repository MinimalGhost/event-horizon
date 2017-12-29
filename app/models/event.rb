class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  belongs_to :location

  def attending
    self.users.count
  end

  def user_list
    self.users
  end
end
