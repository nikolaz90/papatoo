class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  attribute :status, :string, default: "draft"
end
