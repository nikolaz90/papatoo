class Location < ApplicationRecord
  belongs_to :user

  validates :long, :lat, :start_time, presence: true

  attribute :duration, :integer, default: 30
end
