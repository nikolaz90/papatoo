class Location < ApplicationRecord
  belongs_to :user

  validates :long, :lat, :description, :start_time, presence: true
  attribute :duration, :integer, default: 30

  reverse_geocoded_by :lat, :long
  after_validation :reverse_geocode
end
