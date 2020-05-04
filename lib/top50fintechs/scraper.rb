require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

def initialize(category_url)
  @category_url = category_url
end

def scrape
  scrape_companies_titles_and_urls
end


def scrape_companies_titles_and_urls
    array = []
    @doc = Nokogiri::HTML(open(@category_url))
    @doc.search('div[class=margin-wrapper]').each do |company|
    company_hash = {
    :name => company.search('a').attribute('href').value.split('/').join.gsub("-", " ").capitalize,
    :company_url => "https://thefintech50.com#{company.search('a').attr('href').text}"}
    array << company_hash
  end
  array
end



end
