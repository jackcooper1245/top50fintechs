class CLI

BASE_PATH = "https://thefintech50.com/"

def call
  puts "Welcome to Top50fintechs"
  lists_categories
  menu
end


def menu
  puts "Please enter the number of the company you are interested in learning about or type 'exit' to leave the program."
  puts "To return to a previous menu at any point please type 'back'"
  input = ""
  while input != 'exit'
    input = gets.strip
    case input
    when "1"
     make_companies('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019')
     display_companies
     enter_next
    when "2"
      make_companies('https://thefintech50.com/the-hot-ten-2019')
      display_companies
      enter_next
    when "3"
      make_companies('https://thefintech50.com/the-fintech50-2018-list')
      display_companies
      enter_next
    when "4"
      make_companies('https://thefintech50.com/the-fintech-50-2017')
      display_companies
      enter_next
    when "back"
      lists_categories
    when "exit"
      goodbye
    else
      error_assitance
   end
  end
end

def goodbye
  puts "See you next time!"
end

def enter_next
  puts "Please enter the name of the company you would like to know more about or type 'back' to return to the previous menu."
input = gets.strip
if input == 'back'
  Company.destroy
  lists_categories
else
  select_by_name(input)
end
end

def error_assitance
  puts "I don't understand, please select a category or type 'exit' to exit the program"
end

def lists_categories
  puts " "
  puts "1. Top 50 Fintech companies of 2019"
  puts "2. Top 10 Fintech companies of 2019"
  puts "3. Top 50 Fintech companies of 2018"
  puts "4. Top 50 Fintech companies of 2017"
  puts " "
end

def make_companies(category_url)
    company_array = Scraper.new(category_url).scrape
    Company.create_company_from_scrape(company_array)
  end

def display_companies
  Company.all.each_with_index do |company, index|
    puts "#{index + 1}. #{company.name}"
end
end

def select_by_name(input)
  company_profile = Company.all.find {|c| input == c.name}
  puts company_profile.company_url
end


def scrape_by_name(input)
  company_profile = []
  url = select_by_name(name).company_url
  profile = Nokogiri::HTML(open(url))
  profile_hash = {
  :name => profile.css('h2')[0].text}
  company_profile << profile_hash
  puts company_profile
end


end
