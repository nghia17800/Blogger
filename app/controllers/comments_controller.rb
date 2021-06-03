class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Create comment success!"
      redirect_to article_path(@article)
    else
      flash[:danger] = "The data entry is missing!"
      redirect_to article_path(@article)
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:author, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end