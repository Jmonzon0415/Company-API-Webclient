class Company 

  attr_reader :id 
  attr_accessor :name, :address, :commerce
  

  def intitalize(hash)
    @id = hash['id']
    @name = hash['name']
    @address = hash['address']
    @commerce =  hash['commerce']
  end 

  def self.find(id)
     Company.new(Unirest.get("#{ENV['API_BASE_URL']}/companies/#{id}").body)
  end 

  def self.all 
    api_companies_array = Unirest.get("#{ENV['API_BASE_URL']}/companies").body
    companies = []
    api_companies_array.each {|api_company| @companies << Company.new(api_company) }
    companies
    end 
  end 

  def destroy
   Unirest.delete("#{ENV['API_BASE_URL']}/companies/#{id}", headers:{"Accept" => "application/json "}, parameters:{ name: params[:name], address: params[:address], commerce: params[:commerce]}).body
  end 


