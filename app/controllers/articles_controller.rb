class ArticlesController < ApplicationController
  def index
    @articles = Article.order(pub_date: :DESC, sentiment_score: :DESC).all
    @feeds = Feed.all
    @positive = Article.where(:sentiment => :positive)
      .order(pub_date: :DESC, sentiment_score: :DESC).all
    @negative = Article.where(:sentiment => :negative)
      .order(pub_date: :DESC, sentiment_score: :DESC).all
    @neutral = Article.where(:sentiment => :neutral)
      .order(pub_date: :DESC, sentiment_score: :DESC).all
  end
end
