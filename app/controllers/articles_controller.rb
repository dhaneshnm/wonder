class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(sentiment_score: :desc)
  end
end
