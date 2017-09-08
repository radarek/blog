class ArticlesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show, :search, :preview]

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.new_record?
      render "new"
    else
      redirect_to article_path(@article)
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id, commenter: cookies[:commenter])
    @next_article = @article.next_article
  end

  def index
    @articles = Article.all.order(id: :desc)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to articles_path
  end

  def search
    @articles = Article.search(params[:q])
    render :index
  end

  def preview
    article = Article.find(params[:id])
    render json: { text: article.text }
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
