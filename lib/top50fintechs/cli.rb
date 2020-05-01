class Top50fintechs::CLI

def call
  puts "Welcome to Top50FinTechs."
  puts "Please choose from the categories below."
  lists_categories
  menu
end

def lists_categories
  puts "1. Top 50 Fintech companies of 2019"
  puts "2. Top 10 Fintech companies of 2018"
  puts "3. Top 10 Fintech companies of 2017"
  puts "4. Top 10 Fintech companies of 2016"
  puts "5. Top 10 Fintech companies of 2015"
end


def menu
  puts "Please enter the number of the category you are interested in learning about or type 'exit' to leave the program."
  puts "To return to a previous menu at any point please type 'back'"
  input = ""
  while input != 'exit'
    input = gets.strip
    case input
    when "1"
      Top50fintechs::Company.scrape_top_50_2019
      puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
    when "2"
      Top50fintechs::Company.scrape_top_50_2018
      puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
    when "3"
      Top50fintechs::Company.scrape_top_50_2017
      puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
    when "4"
      Top50fintechs::Company.scrape_top_50_2016
      puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
    when "5"
      Top50fintechs::Company.scrape_top_50_2015
      puts "Please enter the number of the company you would like to know more about or type 'back' to return to the previous menu."
    when "back"
      lists_categories
    when "exit"
      goodbye
    else
      puts "I don't understand, please select a category or type 'exit' to exit the program"
   end
  end
end

def goodbye
  puts "See you next time!"
end

end
