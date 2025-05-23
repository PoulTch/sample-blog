class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create] 

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
      @article = current_user.articles.new(article_params)
      @article.user_id = current_user.id
      @article.author = current_user.username
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize! :edit, @article
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path    
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
