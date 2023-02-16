class ArticlesController < ApplicationController
  before_action :require_admin, except: %I[index show]

  def index
    @articles = Article.where(article_type: 0).order(created_at: :desc)
    @suggestions = Article.where(article_type: 1).order(created_at: :desc)
    @links = Link.all.order(:text)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article crée'
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = 'Article mis à jour'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :article_type)
  end
end
