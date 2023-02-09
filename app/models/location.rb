class Location < ApplicationRecord
  belongs_to :user

  validates :long, :lat, :description, :start_time, presence: true
  attribute :duration, :integer, default: 30

  reverse_geocoded_by :lat, :long
  after_validation :reverse_geocode

  scope :current_and_future_locations, -> {
    where("start_time >= :time_now", time_now: Time.now - 6.hours)
  }
end
