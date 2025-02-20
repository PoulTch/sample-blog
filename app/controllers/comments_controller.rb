class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def create  
    @article = Article.find(params[:article_id])  
    if @article.comments.create(comment_params)
      redirect_to article_path(@article)
    else
      render action: 'show'    
    end
  end    


  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end