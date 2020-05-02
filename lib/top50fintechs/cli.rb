class Top50fintechs::CLI

def call
  puts "Welcome to Top50FinTechs."
  puts "Please choose from the companies below below."
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
      Top50fintechs::Companies.create_from_collection(Top50fintechs::Scraper.scrape_top_50_2019)
      puts " "
      enter_next
    when "2"
      Top50fintechs::Companies.create_from_collection(Top50fintechs::Scraper.scrape_top_10_2019)
      puts " "
      enter_next
    when "3"
      Top50fintechs::Companies.create_from_collection(Top50fintechs::Scraper.scrape_top_50_2018)
      puts " "
      enter_next
    when "4"
      Top50fintechs::Companies.create_from_collection(Top50fintechs::Scraper.scrape_top_50_2017)
      puts " "
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
  puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
end

def error_assitance
  puts "I don't understand, please select a category or type 'exit' to exit the program"
end

def lists_categories
  puts " "
  puts "1. Top 50 Fintech companies of 2019"
  puts "2. Top 50 Fintech companies of 2019"
  puts "3. Top 50 Fintech companies of 2018"
  puts "4. Top 50 Fintech companies of 2017"
  puts " "
end

end
