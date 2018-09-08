require 'open-uri'
require 'nokogiri'
require 'sentimental'
require 'textmood'

module FeedsHelper
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
