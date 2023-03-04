class DropPortfolioArticleData < ActiveRecord::Migration[7.0]
  def change
    drop_table :portfolio_article_data
  end
end
