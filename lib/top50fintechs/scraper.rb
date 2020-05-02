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
  scrape_companies
  @category
end

def scrape_details
  @category.title = @doc.search('h2')[2].text
end

def scrape_companies
  @doc.search('div[class=margin-wrapper]').each do |company|
    c = Company.new
    c.name = company.search('a').attribute('href').value.split('/').join.gsub("-", " ").capitalize
    c.company_url = "https://thefintech50.com#{company.search('a').attr('href').text}"

    @category.add_companies(c)
  end
  @category.companies
end

end
