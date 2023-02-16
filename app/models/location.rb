class Location < ApplicationRecord
  belongs_to :user

  validates :long, :lat, :description, :duration, :start_time, presence: true
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  attribute :duration, :integer, default: 30
  attribute :start_time, :datetime, default: Time.now

  scope :current_and_future_locations, -> { where("end_time >= :time_now", time_now: Time.now) }

  reverse_geocoded_by :lat, :long
  after_validation :reverse_geocode

  after_validation :set_end_time

  private

  def set_end_time
    self.end_time = start_time + duration.minutes
  end
end
