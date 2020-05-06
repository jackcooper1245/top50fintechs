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

def self.scrape_by_name(input)
  url = Company.select_by_name(input)
  profile_array = []
  html = Nokogiri::HTML(open(url))
  profile_hash = {}

  profile_hash[:name] = html.css('h2')[0].text
  profile_hash[:website] = html.css('div.sqs-block-content p:first a').attribute('href')

  html.css('.sqs-block-content p').each do |el|
    if el.text.include?("Founders")
      profile_hash[:founders] = el.text
    elsif
      el.text.include?("Founded")
      profile_hash[:founded] = el.text
    elsif
      el.text.include?("Last funding")
      profile_hash[:last_funding] = el.text
    elsif
      el.text.include?("HQ")
      profile_hash[:HQ] = el.text
    elsif
      el.text.include?('t:')
      profile_hash[:twitter] = el.text
    elsif
      el.text.include?("Keyword")
      profile_hash[:keywords] = el.text
    end
  end

  profile_array << profile_hash
  profile_array
end

end
