class CommentsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy]
  # protect_from_forgery with: :null_session, only: [:vote]
  skip_before_action :verify_authenticity_token, only: [:vote]

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(article_id: @article.id)
    @comment.attributes = comment_params

    if @comment.save
      cookies[:commenter] = @comment.commenter
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to article_path(comment.article)
  end

  def vote
    comment = Comment.find(params[:id])
    if session[:voted_comments_id].nil? || !session[:voted_comments_id].include?(comment.id)
      if params[:dir] == "up"
        comment.increment!(:rank)
      elsif params[:dir] == "down"
        comment.decrement!(:rank)
      end

      session[:voted_comments_id] ||= []
      session[:voted_comments_id] << comment.id
    end

    respond_to do |format|
      format.html do
        redirect_to article_path(comment.article)
      end

      format.json do
        render json: { rank: comment.rank, id: comment.id }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
