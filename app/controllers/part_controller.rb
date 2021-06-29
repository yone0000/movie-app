class PartController < ApplicationController
  def show
    @articles = Article.includes(:user)
    @article = Article.find(params[:id])
  end
end

