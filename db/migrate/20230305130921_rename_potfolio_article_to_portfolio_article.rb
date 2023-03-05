class RenamePotfolioArticleToPortfolioArticle < ActiveRecord::Migration[7.0]
  def change
    rename_table :potfolio_articles, :portfolio_articles
  end
end
