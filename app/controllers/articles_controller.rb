class ArticlesController < ApplicationController
  def index
    @articles = Article.order(pub_date: :DESC, sentiment_score: :DESC).all
  end
end
