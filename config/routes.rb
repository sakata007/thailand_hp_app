Rails.application.routes.draw do
  
  post '/confirm'=> 'products#confirm'
  get '/'=> 'products#index'
  
end
