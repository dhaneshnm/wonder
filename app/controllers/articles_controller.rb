class ArticlesController < ApplicationController
  def index
    if(params[:feed_id])
      @articles = Article.where(:feed_id => params[:feed_id])
        .order(pub_date: :DESC, sentiment_score: :DESC).all
      @feeds = Feed.all
      @positive = Article.where(:feed_id => params[:feed_id], :sentiment => :positive)
        .order(pub_date: :DESC, sentiment_score: :DESC).all
      @negative = Article.where(:feed_id => params[:feed_id], :sentiment => :negative)
        .order(pub_date: :DESC, sentiment_score: :DESC).all
      @neutral = Article.where(:feed_id => params[:feed_id], :sentiment => :neutral)
        .order(pub_date: :DESC, sentiment_score: :DESC).all
    else 
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
end
