require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Companies

attr_accessor :company_name, :website, :twitter, :linkedin, :founders, :founded, :who_is_it_for, :keywords, :latest_funding, :total_funding, :offices, :company_moto, :bio

def self.new_from_scraper_top_50_2019
  companies = []
  Top50fintechs::Scraper.scrape_top_50_2019.each do |company|
    companies << company
  end
  companies
end


#@@all = []

##def initialize(company_name, website, twitter, linkedin, founders, founded, who_is_it_for, keywords, latest_funding, total_funding, offices, company_moto, bio)
#  @company_name = company_name
#  @website = website
#  @twitter = twitter
##  @linkedin = linkedin
#  @founders = founders
#  @founded = founded
#  @who_is_it_for = who_is_it_for
#  @keywords = keywords
#  @latest_funding = latest_funding
#  @total_funding = total_funding
#  @offices = offices
#  @company_moto = company_moto
#  @bio = bio
#end
end
