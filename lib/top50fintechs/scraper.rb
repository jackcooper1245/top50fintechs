require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Top50fintechs::Scraper

def get_page_top_50_2019
   Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019'))
   binding.pry
end

def get_page_top_10_2019
  Nokogiri::HTML(open('https://thefintech50.com/the-hot-ten-2019'))
end

def get_page_hall_of_fame
  Nokogiri::HTML(open('https://thefintech50.com/the-fintech50-hall-of-fame-1'))
end

#def scrape_companies_list(index_url_method)
#company_list = self.index_url_method.css('div.sqs-gallery sqs-galler-design-grid')
#company_list.each_with_index do |company, index|
# puts "#{index + 1}. #{company.css('a').attribute('href').value}"
#end
#end

end
