require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Company

attr_accessor :name, :company_url, :category

@@all = []

def initialize(company_hash)
  self.send('name=', company_hash[:name])
  self.send('company_url=', company_hash[:company_url])
end

def self.create_company_from_scrape(company_array)
  company_array.each do |company_hash|
  Company.new(company_hash)
  @@all << self
  end
end

def scrape_by_name(name)
  company_profile = []
  url = select_by_name(name).company_url
  profile = Nokogiri::HTML(open(url))
  profile_hash = {
  :name => profile.css('h2')[0].text}
  company_profile << profile_hash
  company_profile
end

def select_by_name(name)
  self.companies.select {|c| name == c.name}
end

def self.all
  @@all
end

end
