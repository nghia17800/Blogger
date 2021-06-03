class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by id: params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Create article success!"
      redirect_to articles_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Profile updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "article deleted"
    redirect_to articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end