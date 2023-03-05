class PortfolioArticle < ApplicationRecord
  validates :title, :description, :url, presence: true
end
