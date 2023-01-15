class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @articles = Article.all
  end

  def my_index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :category, :content)
  end
end
