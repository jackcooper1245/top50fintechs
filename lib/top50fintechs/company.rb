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
  @@all << self
end

def self.create_company_from_scrape(company_array)
  company_array.each do |company_hash|
  Company.new(company_hash)
  end
end

def self.print_all
  self.all.each_with_index do |company, index|
    puts "#{index + 1}. #{company.name}"
end
end

def self.all
  @@all
end

def self.destroy
  @@all.clear
end

end
