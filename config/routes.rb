Rails.application.routes.draw do
  
  post '/confirm'=> 'products#confirm'
  get '/'=> 'products#index'
  
  # TODO: /admin以下にbasic認証
  get '/admin/products/create'=> 'products#create'
end
