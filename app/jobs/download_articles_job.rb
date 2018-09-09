require 'open-uri'
require 'nokogiri'
require 'sentimental'
require 'textmood'
require 'rss'

class DownloadArticlesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    begin
      Feed.all.each do |feed|
        rss = RSS::Parser.parse(open(feed.url).read, false)
        rss.items.each do |item|
          if( Article.find_by_link(item.link) == nil)
            begin
              content = text_content(item.link.strip)
              article = {
                :link => item.link.strip,
                :title => item.title,
                :description => URI.unescape(item.description).html_safe,
                :text_content => content,
                :sentiment => sentiments(content),
                :sentiment_score =>  textmoods(content),
                :feed_id => feed.id
              }
              Article.create(article)
              sleep(1)
            rescue
              puts 'link failed'
            end    
          end
        end  
      end
    rescue
      puts 'feed failed'    
    end
  end

  def text_content link
    doc = Nokogiri::HTML(open(link))
    text = ''
    doc.css('p,h1').each do |e|
      text << e.content
    end
    text
  end  
  
  def sentiments text
    analyzer = Sentimental.new
    analyzer.load_defaults
    analyzer.sentiment text
  end 

  def textmoods text
    TextMood.new(language: "en").analyze(text)
  end 

end
