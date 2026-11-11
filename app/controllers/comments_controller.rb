class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(params.expect(comment: %i[commenter body]))
    if @comment.save
      redirect_to @article
    else
      redirect_to @article, alert: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @article.comments.find(params[:id]).destroy
    redirect_to @article, status: :see_other
  end

  private
  def set_article = @article = Article.find(params[:article_id])
end
