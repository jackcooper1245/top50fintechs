class CLI


def call
  puts "Welcome to Top50fintechs"
  lists_categories
  menu
end


def menu
  puts "Please enter the number of the company you are interested in learning about or type 'exit' to leave the program."
  puts "To return to a previous menu at any point please type 'back'"
  input = " "
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
      Company.destroy
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
else
  select_by_name(input)
  scrape_by_name
  display_company
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

def scrape_by_name
  profile_array = []
  html = Nokogiri::HTML(open(@company_variable.company_url))
  profile_hash = {}

    profile_hash[:name] = html.css('h2')[0].text
    profile_hash[:website] = html.css('div.sqs-block-content p:first a').attribute('href')
    #profile_hash[:founders] = html.css('div.sqs-block-content p') if html.css('div.sqs-block-content p').text.include?("Founders")
    #profile_hash[:keywords] = html.css('p')[5]
    #profile_hash[:who_is_it_for] = html.css('p')[10]
    #profile_hash[:bio1] = html.css('div.sqs-block-content p')[10].text
    #profile_hash[:bio2] = html.css('div.sqs-block-content p')[11].text
    #profile_hash[:moto] = html.css('h2.white-space:pre-wrap')[1]
    #profile_hash[:bio] = html.css('p')[2].text
    #p#rofile_hash[:website] = html.css('p')[2].text
    #pr#ofile_hash[:twitter] = html.css('p')[2].text

  profile_array << profile_hash
  profile_array
end

def select_by_name(input)
  if input == 'back'
    Company.destroy
    lists_categories
  else
  @company_variable = Company.all.find {|c| input == c.name}
  @company_variable.company_url
end
end

def display_company
  company = scrape_by_name[0]
  puts "Name: #{company[:name]}"
  puts "-------------------------"
  puts "Company website: #{company[:website]}"
  puts " #{company[:founders]}"
  puts " "
  puts "-------------------------"
end

end
