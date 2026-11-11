class ArticlesController < ApplicationController
  def index = @articles = Article.order(created_at: :desc)
  def show = @article = Article.find(params[:id])
  def new = @article = Article.new
  def edit = @article = Article.find(params[:id])

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to root_path, status: :see_other
  end

  private
  def article_params = params.expect(article: %i[title body])
end
