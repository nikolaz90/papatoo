class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  attribute :status, :string, default: "draft"
  attribute :accepts_comments, :boolean, default: true
end
