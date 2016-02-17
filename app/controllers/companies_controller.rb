class CompaniesController < ApplicationController
  def index
    @companies = Company.all 
    #logic in company model 
  end

  
  def new
  end 


  def create               
    @company = Unirest.post("http://localhost:3000/companies/#{params[:id]}", 
      parameters:{ name: params[:name], address: params[:address], commerce: params[:commerce]}).body 
  
    render :show 

  end 

  def show
    @company = Company.find(params[:id])
  end

  def edit
  end 

  def update
    @company = Unirest.patch("http://localhost:3000/companies/#{params[:id]}" , 
      parameters:{ name: params[:name ], address: params[:address], commerce: params[:commerce]}).body
  end


  def destroy 
    @company = Company.find(params[:id])
    message = @company.destroy 
    
    flash[:message] = message["message"]
    redirect_to '/companies'
  end  



end
