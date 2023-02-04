class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  attribute :status, :string, default: "draft"
  attribute :accepts_comments, :boolean, default: true

  include PgSearch::Model
  pg_search_scope :search_title_and_content,
                  against: %i[title content],
                  using: {
                    tsearch: { prefix: true, dictionary: "english", any_word: true }
                  }
end
