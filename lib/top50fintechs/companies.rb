require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Companies

attr_accessor :company_name, :website, :twitter, :linkedin, :founders, :founded, :who_is_it_for, :keywords, :latest_funding, :total_funding, :offices, :company_moto, :bio

@@all = []

def initialize(name = nil)
  @name = name
  @@all << self
end

def self.create_from_collection(company_list)
    company_list.each do |company_hash|
      Top50fintechs::Companies.new(company_hash)
    end
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
