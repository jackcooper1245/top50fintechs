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
  @company_urls = []
end


def scrape
  scrape_details
  scrape_companies_titles
  @category
end

def scrape_details
  @category.title = @doc.search('h2')[2]
end

def scrape_companies_titles
  @doc.search('div[class=margin-wrapper]').each do |company|
    c = Company.new
    c.name = company.search('a').attribute('href').value.split('/').join.gsub("-", " ").capitalize
    @category.add_companies(c)
  end
  @category.companies
end

def scrape_company_urls
  @doc.search('div[class=margin-wrapper]').each do |company|
  @company_urls << company_url = "https://thefintech50.com#{company.search('a').attr('href').text}"
  end
  @company_urls
end

def scrape_company_profiles
  company_array = []
  @company_urls.each do |url|
  profile = Nokogiri::HTML(open(url))
    names = profile.css('h2')[0].text
  company_array << names
end
company_array
end

def get_test
html = Nokogiri::HTML(open(@company_urls[0]))
test1 = html.css('h2')[0].text
test1
end

end
