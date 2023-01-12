class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  attribute :status, :string, default: "draft"
end
