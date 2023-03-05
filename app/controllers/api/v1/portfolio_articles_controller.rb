class Api::V1::PortfolioArticlesController < Api::V1::BaseController
  def index
    @portfolio_articles = PortfolioArticle.all
  end
end
