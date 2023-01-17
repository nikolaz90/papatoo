class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.article = Article.find(params[:article_id])
    if @comment.save
      redirect_to article_path(params[:article_id])
    end
    authorize @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
