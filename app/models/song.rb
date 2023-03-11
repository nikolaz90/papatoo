class Song < ApplicationRecord
  validates :title, :artist, :description, presence: true
  has_one_attached :song_file

  def song_url
    Rails.application.routes.url_helpers.url_for(song_file) if song_file.attached?
  end
end
