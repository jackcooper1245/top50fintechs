require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

attr_accessor :category, :doc, :category_url, :companies

def initialize(category_url)
  @category = Category.new
  @category_url = category_url
  @doc = Nokogiri::HTML(open(@category_url))
end


def scrape
  scrape_details
  @category
end

def scrape_details
  @category.title = @doc.search('h2')[2].text
end

def scrape_companies
  array = []
  @doc.search('div[class=margin-wrapper]').each do |company|
  array << company.search('a').attribute('href').value
  end
  puts array
end

end
