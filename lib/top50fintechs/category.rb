class Category

attr_accessor :title

@@all = []

def initialize
  @companies = []
  save
end

def save
  @@all << self
end

def add_companies(company)
    if
    !company.is_a?(Company)
    raise InvalidType, "Must be a Compant"
    else
      @companies << company
  end
end

def companies
  @companies.dup.freeze
end

end
