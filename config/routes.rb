Rails.application.routes.draw do
  get '/' => 'companies#index'

  get '/companies/:id' => 'companies#show'
  

  get '/companies/new' => 'companies#new'
  post '/companies/:id' => 'companies#create'


  delete '/companies/:id' => 'companies#destroy'
  

end
