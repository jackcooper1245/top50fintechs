require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Company

attr_accessor :company_name, :website, :twitter, :linkedin, :founders, :founded, :who_is_it_for, :keywords, :latest_funding, :total_funding, :offices, :company_moto, :bio

def self.top_50_2019
  puts "Apple"
  puts "Revolut"
  puts "Monzo"
end

def self.scrape_top_50
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end

def self.top_10_2019
  puts "company a - somewhere - something"
  puts "company b - somewhere - something"
end


def self.hall_of_fame
  puts "it's working - a place - a thing"
end

end
