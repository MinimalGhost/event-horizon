class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  belongs_to :location
  validate :date_cannot_be_in_the_past
  validate :location_and_date_cannot_exist
  validate :limit_size

  def self.search(q)
    if !q.to_s.empty?
      self.all.select {|event| event.location.name == q.downcase}
    else
      self.all
    end
  end

  def attending
    self.users.count
  end

  def date_cannot_be_in_the_past
    if self.date.present? && self.date < Date.today
      errors.add(:date, "Date can't be in the past")
    end
  end

  def location_and_date_cannot_exist
    if self.location.event_dates.any? { |date| date == self.date }
      errors.add(:date, "Location is already booked on that date")
    end
  end

  def limit_size
    if self.size > self.location.capacity
      errors.add(:capacity, "Event exceeds location capacity")
    end
  end
end
