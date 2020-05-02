require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

attr_accessor :category, :doc, :category_url

def initialize(category_url)
  @category = Category.new
  @category_url = category_url
  @doc = Nokogiri::HTML(open(@category_url))
end


def scrape
  scrape_details
  @category
end

#def scrape_details
#  title = doc.css('div.h2.white-space:prewrap').text
#end

end
