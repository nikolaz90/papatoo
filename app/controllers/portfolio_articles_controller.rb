class PortfolioArticlesController < ApplicationController
  def index
    @portfolio_articles = policy_scope(PortfolioArticle)
  end

  def new
    @portfolio_article = PortfolioArticle.new
    authorize @portfolio_article
  end

  def create
    @portfolio_article = PortfolioArticle.new(portfolio_article_params)
    authorize @portfolio_article
    if @portfolio_article.save
      redirect_to portfolio_articles_path
    else
      render :new
    end
  end

  def destroy
    @portfolio_article = PortfolioArticle.find(params[:id])
    authorize @portfolio_article
    @portfolio_article.destroy
    redirect_to portfolio_articles_path
  end

  private

  def portfolio_article_params
    params.require(:portfolio_article).permit(:title, :description, :url)
  end
end
