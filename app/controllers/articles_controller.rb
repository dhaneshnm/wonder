class ArticlesController < ApplicationController
  def index
    @articles = Article.order(updated_at: :DESC, sentiment_score: :DESC).all
  end
end
