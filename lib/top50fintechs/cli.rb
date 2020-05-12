require 'pry'
class CLI


def call
  puts "Welcome to Top50fintechs"
  lists_categories
  menu
end


def menu
  puts "To return to a previous menu at any point please type 'back'"
  input = " "
  while input != 'exit'
    input = gets.strip
    case input
    when "1"
     make_companies('https://thefintech50.com/the-fintech50-2019-50-fintechs-to-watch-in-2019')
     Company.print_all
     enter_next
    when "2"
      make_companies('https://thefintech50.com/the-hot-ten-2019')
      Company.print_all
      enter_next
    when "3"
      make_companies('https://thefintech50.com/the-fintech50-2018-list')
      Company.print_all
      enter_next
    when "4"
      make_companies('https://thefintech50.com/the-fintech-50-2017')
      Company.print_all
      enter_next
    when "back"
      Company.destroy
      lists_categories
    when "return"
      Company.print_all
      enter_next
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
  if input == "back"
    Company.destroy
    lists_categories
  elsif
    input == "exit"
    lists_categories
  elsif
    Scraper.scrape_by_name(input)
    display_company(input)
  end
end

def error_assitance
  puts "I don't understand, please try again or type 'exit' to exit the program"
end

def lists_categories
  puts " "
  puts "1. Top 50 Fintech companies of 2019"
  puts "2. Top 10 Fintech companies of 2019"
  puts "3. Top 50 Fintech companies of 2018"
  puts "4. Top 50 Fintech companies of 2017"
  puts " "
  puts "Please enter the number of the category you are interested in learning about or type 'exit' to leave the program."

end


def make_companies(category_url)
  company_array = Scraper.new(category_url).scrape
  Company.create_company_from_scrape(company_array)
end


def display_company(input)
  company = Scraper.scrape_by_name(input)[0]
  puts "Name: #{company[:name]}"
  puts "-------------------------"
  puts "Company website: #{company[:website]}"
  puts "#{company[:founders]}"
  puts "#{company[:founded]}"
  puts "#{company[:HQ]}"
  puts "#{company[:twitter]}"
  puts "#{company[:keywords]}"
  puts "-------------------------"
  puts "To return to the list please enter 'return'"
end


end
