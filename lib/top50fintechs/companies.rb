require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Company

attr_accessor :company_name, :website, :twitter, :linkedin, :founders, :founded, :who_is_it_for, :keywords, :latest_funding, :total_funding, :offices, :company_moto, :bio


def self.scrape_top_50_2019
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end

def self.scrape_top_50_2018
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2018-list'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end

def self.scrape_top_50_2017
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech-50-2017'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end

def self.scrape_top_50_2016
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech-50-2016'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end


def self.scrape_top_50_2015
  company_list = []
  html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech-50-2015'))
  array = html.css('div.margin-wrapper')
  array.each_with_index do |company, index|
    company_name = company.css('a').attribute('href').value
    company_list << "#{index + 1}. #{company_name.split('/').join.capitalize}"
end
puts company_list
end

end
