class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = policy_scope(Article).includes(:user)
  end

  def show
    authorize @article
    @comment = Comment.new
  end

  def my_index
    @articles = policy_scope(Article).where(user: current_user)
    authorize @articles
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.create(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
    authorize @article
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to my_articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :category, :content, :accepts_comments)
  end
end
