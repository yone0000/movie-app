class ReviewsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to article_path(@review.article)
    else
      @article = Article.find(params[:article_id])
      @articles = Article.includes(:user)
      render "articles/index"
    end
  end

  private
  def review_params
    params.require(:review).permit(:score).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end

