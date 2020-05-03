#class Category

#attr_accessor :company

#@@all = []

#def initialize
#  @companies = []
#  save
#end


#def print_company_names
 #self.companies.each_with_index do |company, index|
  #puts "#{index +1 }. #{company.name}"
#end
#end

#def select_by_name(name)
#  self.companies.select {|c| name == c.name}
#end

#def scrape_by_name(name)
#  company_profile = []
#  url = select_by_name(name).company_url
#  profile = Nokogiri::HTML(open(url))
#  profile_hash = {
#  :name => profile.css('h2')[0].text}
#  company_profile << profile_hash
#  company_profile
#end

#def save
#  @@all << self
#end

#def add_companies(company)
#  @companies << company
#end

#def companies
#  @companies
#end

#end
