require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Scraper


  def self.scrape_top_50_2019
    company_list = []
    html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019'))
    array = html.css('div.margin-wrapper')
    array.each_with_index do |company, index|
      company_name = company.css('a').attribute('href').value
      company_list << "#{index + 1}. #{company_name.split('/').join.gsub("-", " ").capitalize}"
  end
  puts company_list
  end

  def self.scrape_top_10_2019
    company_list = []
    html = Nokogiri::HTML(open('https://thefintech50.com/the-hot-ten-2019'))
    array = html.css('div.margin-wrapper')
    array.each_with_index do |company, index|
      company_name = company.css('a').attribute('href').value
      company_list << "#{index + 1}. #{company_name.split('/').join.gsub("-", " ").capitalize}"
  end
  puts company_list
  end

  def self.scrape_top_50_2018
    company_list = []
    html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2018-list'))
    array = html.css('div.margin-wrapper')
    array.each_with_index do |company, index|
      company_name = company.css('a').attribute('href').value
      company_list << "#{index + 1}. #{company_name.split('/').join.gsub("-", " ").capitalize}"
  end
  puts company_list
  end

  def self.scrape_top_50_2017
    company_list = []
    html = Nokogiri::HTML(open('https://thefintech50.com/the-fintech-50-2017'))
    array = html.css('div.margin-wrapper')
    array.each_with_index do |company, index|
      company_name = company.css('a').attribute('href').value
      company_list << "#{index + 1}. #{company_name.split('/').join.gsub("-", " ").capitalize}"
  end
  puts company_list
  end






end
