class Location < ApplicationRecord
  validates :name, presence: true
  has_many :events

  def event_dates
    self.events.map do |event|
      event.date
    end
  end
end
